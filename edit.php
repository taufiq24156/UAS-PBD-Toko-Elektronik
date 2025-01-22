<?php
include 'config.php';

$id = $_GET['id'];
$result = $conn->query("SELECT * FROM produk WHERE id_produk = $id");
$data = $result->fetch_assoc();
?>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Produk</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <h1>Edit Produk</h1>
    <form method="POST" action="">
        <label>Nama Produk:</label><br>
        <input type="text" name="nama" value="<?php echo $data['nama']; ?>"><br>
        <label>Kategori:</label><br>
        <input type="text" name="kategori" value="<?php echo $data['kategori']; ?>"><br>
        <label>Harga:</label><br>
        <input type="number" name="harga" value="<?php echo $data['harga']; ?>"><br>
        <input type="submit" name="submit" value="Update">
    </form>
    <?php
    if (isset($_POST['submit'])) {
        $nama = $_POST['nama'];
        $kategori = $_POST['kategori'];
        $harga = $_POST['harga'];

        $sql = "UPDATE produk SET nama = '$nama', kategori = '$kategori', harga = '$harga' WHERE id_produk = $id";
        if ($conn->query($sql) === TRUE) {
            echo "Produk berhasil diupdate!";
            header("Location: index.php");
        } else {
            echo "Error: " . $sql . "<br>" . $conn->error;
        }
    }
    ?>
</body>
</html>
