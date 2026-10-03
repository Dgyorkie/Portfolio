<?php
session_start();

if (!isset($_SESSION['username'])) {
    header("Location: login.php");
    exit();
}

echo "<h2> Welcome " . htmlspecialchars($_SESSION['username']) . "! </h2>";

if (!isset($_GET['id'])) {
    echo "No CV selected.";
    exit();
}

$id = $_GET['id'];

require_once('connectdb.php');

try {
    $sth = $db->prepare("SELECT * FROM cvs WHERE id = :id");
    $sth->bindParam(':id', $id, PDO::PARAM_INT);
    $sth->execute();

    if ($sth->rowCount() > 0) {
        echo "<table cellspacing='0' cellpadding='5' id='myTable'>";
        echo "<tr><th align='left'><b>User_Profile</b></th><th align='left'><b>Education</b></th><th align='left'><b>URLlinks</b></th></tr>";

        while ($row = $sth->fetch(PDO::FETCH_ASSOC)) {
            echo "<tr>";
            echo "<td align='left'>" . htmlspecialchars($row['profile']) . "</td>";
            echo "<td align='left'>" . htmlspecialchars($row['education']) . "</td>";
            echo "<td align='left'>" . htmlspecialchars($row['URLlinks']) . "</td>";
            echo "</tr>";
        }

        echo "</table>";
    } else {
        echo "<p>No users in the list.</p>";
    }
}
catch (PDOException $ex) {
    echo "Sorry, a database error occurred! <br>";
    echo "Error details: <em>" . htmlspecialchars($ex->getMessage()) . "</em>";
}
?>

<p>Would like to log out? <a href="logout.php">Log out</a></p>