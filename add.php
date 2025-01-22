<?php include 'config.php'; ?>
<!DOCTYPE html>
<html>
<head>
    <title>Tambah Produk</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <h1>Tambah Produk</h1>
    <form method="POST" action="">
        <label>Nama Produk:</label><br>
        <input type="text" name="nama"><br>
        <label>Kategori:</label><br>
        <input type="text" name="kategori"><br>
        <label>Harga:</label><br>
        <input type="number" name="harga"><br>
        <input type="submit" name="submit" value="Tambah">
    </form>
    <?php
    if (isset($_POST['submit'])) {
        $nama = $_POST['nama'];
        $kategori = $_POST['kategori'];
        $harga = $_POST['harga'];

        $sql = "INSERT INTO produk (nama, kategori, harga) VALUES ('$nama', '$kategori', '$harga')";
        if ($conn->query($sql) === TRUE) {
            echo "Produk berhasil ditambahkan!";
            header("Location: index.php");
        } else {
            echo "Error: " . $sql . "<br>" . $conn->error;
        }
    }
    ?>
</body>
</html>
