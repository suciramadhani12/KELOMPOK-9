<?php include 'template/header.php';?>
<br>
<?php
            if(isset($_POST['tambahkasir']))
            {
                
                $username = htmlspecialchars($_POST['username']);
                $nama_toko = htmlspecialchars($_POST['nama_toko']);
                $alamat = htmlspecialchars($_POST['alamat']);
                $telpon = htmlspecialchars($_POST['telepon']);
                $password = password_hash($_POST['password'], PASSWORD_DEFAULT);

                $tambahkat = mysqli_query($conn,"INSERT INTO login (username, nama_toko, alamat, telepon, password)
                values ('$username','$nama_toko','$alamat','$telpon','$password')");
                if ($tambahkat){
                    echo '<script>alert("Berhasil Menambahkan Data");window.location="pengaturan.php"</script>';
                } else {
                    echo '<script>alert("Gagal Menambahkan Data");history.go(-1);</script>';
                }
            };
                
                if(isset($_POST['update'])){
                $id = htmlspecialchars($_POST['id_login']);
                $user = htmlspecialchars($_POST['username']);
                $toko = htmlspecialchars($_POST['nama_toko']);
                $alamat = htmlspecialchars($_POST['alamat']);
                $telp = htmlspecialchars($_POST['telepon']);
                $pass = password_hash($_POST['password'], PASSWORD_DEFAULT);
                $result = mysqli_query($conn, "UPDATE login SET username='$user', password='$pass',nama_toko='$toko',alamat='$alamat',telepon='$telp'
                 WHERE id_login = '$id' ") or die(mysqli_connect_error());
                if($result){
                    echo '<script>alert("Berhasil Update Data");window.location="pengaturan.php"</script>';
                    } else{
                        echo '<script>alert("Gagal Menambahkan Data");history.go(-1);</script>';
            }
            
                       
        };?>
<div class="card">
    <div class="card-header">
        <div class="card-tittle"><i class="fa fa-table me-2"></i> Data Kasir
        <button type="button" class="btn btn-primary btn-xs p-2 float-right" data-toggle="modal" data-target="#addkasir">
            <i class="fa fa-plus fa-xs mr-1"></i> Tambah Data</button></div>
    </div>
        <div class="card-body">
            <table class="table table-striped table-sm table-bordered dt-responsive nowrap" id="table" width="100%">
                        <thead>
                        <tr>
                                                      
                            <th>Username</th>
                            <th>Telepon</th>
                            <th>Alamat</th>
                            <th>opsi</th>
                                                        
                        </tr>
                        </thead>
                        <tbody>
                            <?php
                                $no=1;
                                $data_produk=mysqli_query($conn,"SELECT * FROM login order by id_login ASC");
                                while($d=mysqli_fetch_array($data_produk)){
                                    $id_login = $d['id_login'];
                                    ?>
                                    
                                    <tr>
                                        
                                        <td><?php echo $d['username'] ?></td>
                                        
                                        <td><?php echo $d['telepon'] ?></td>
                                        <td><?php echo $d['alamat'] ?></td>
                                        
                                        
                                        <td>
                                            <button type="button" class="btn btn-primary btn-xs"
                                             data-toggle="modal" data-target="#edit<?php echo $id_login ?>">
                                             <i class="fa fa-pen fa-xs mr-1"></i>Edit</button>
                                            <a class="btn btn-danger btn-xs" href="?hapus=<?php echo $id_login ?>" 
                                            onclick="javascript:return confirm('Hapus Data kasir - <?php echo $d['username'] ?> ?');">
                                            <i class="fa fa-trash fa-xs mr-1"></i>Hapus</a>
                                        </td>
                                    </tr>
                                    
                                    <!-- modal edit -->
                                    <div class="modal fade" id="edit<?php echo $id_login ?>" tabindex="-1" role="dialog" aria-labelledby="ModalTittle2" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                            <form method="post">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="ModalTittle2"><i class="fa fa-user mr-1 text-muted"></i> Edit Pelanggan</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <div class="form-group mb-2">
                                                    <label for="username">Nama Pelanggan :</label>
                                                    <input type="hidden" name="id_login" class="form-control" value="<?php echo $d['id_login'] ?>">
                                                    <input type="text" name="username" class="form-control" value="<?php echo $d['username'] ?>" required>
                                                </div>
                                                <div class="form-group mb-2">
                                                    <label for="telepon">Telepon: </label>
                                                    <input name="telepon" type="number" class="form-control" value="<?php echo $d['telepon'] ?>" id="telepon" placeholder="0821xxx" required>
                                                </div>
                                                <div class="form-group mb-2">
                                                     <label for="alamat">Alamat<span class="text-danger">*</span></label>
                                                    <input type="text" name="alamat" class="form-control" value="<?php echo $d['alamat'] ?>" required>
                                                </div>
                                                <div class="form-group mb-2">
                                                     <label for="nama_toko">Nama Toko</label>
                                                    <input type="text" name="nama_toko" class="form-control" value="<?php echo $d['nama_toko'] ?>" required>
                                                </div>
                                                <div class="form-group mb-2">
                                                     <label for="password">Password</label>
                                                    <input type="text" name="password" class="form-control" value="<?php echo $d['password'] ?>" required>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-light btn-xs p-2" data-dismiss="modal">
                                                    <i class="fa fa-times mr-1"></i> Batal</button>
                                                <button type="submit" class="btn btn-primary btn-xs p-2" name="update">
                                                <i class="fa fa-plus-circle mr-1"></i> Simpan</button>
                                            </div>
                                            </form>
                                            </div>
                                        </div>
                                        </div>
                                    <!-- end modal edit -->
<?php }?>
</tbody>
    </table>
    </div>
</div>
<?php 
    if(!empty($_GET['hapus'])){
        $id_login = $_GET['hapus'];
        $hapus_data = mysqli_query($conn, "DELETE FROM login WHERE id_login='$id_login'");
        if($hapus_data){
            echo '<script>alert("Berhasi Hapus kasir");window.location="kasir.php"</script>';
        } else {
            echo '<script>alert("gagal Hapus kasir");history.go(-1);</script>';
        }
    };
    ?>
<!-- Modal -->
<div class="modal fade" id="addkasir" tabindex="-1" role="dialog" aria-labelledby="ModalTittle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
    <form method="post">
      <div class="modal-header">
        <h5 class="modal-title" id="ModalTittle"><i class="fa fa-shopping-bag mr-1 text-muted"></i> Data Admin</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <div class="form-group mb-2">
                <label>Username :</label>
                <input type="text" name="username" class="form-control" required>
            </div>
            <div class="form-group mb-2">
                <label>nama toko :</label>
                <input type="text" name="nama_toko" class="form-control" required>
            </div>
            <div class="form-group mb-2">
                <label>Telepon :</label>
                <input type="number" name="telepon" class="form-control" required>
            </div>
            <div class="form-group mb-2">
                <label>Alamat :</label>
                <input type="text" name="alamat" class="form-control" required>
            </div>
            <div class="form-group mb-2">
                <label>Password :</label>
                <input type="text" name="password" class="form-control" required>
            </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-light btn-xs p-2" data-dismiss="modal">
            <i class="fa fa-times mr-1"></i> Batal</button>
        <button type="reset" class="btn btn-danger btn-xs p-2">
        <i class="fa fa-trash-restore-alt mr-1"></i> Reset</button>
        <button type="submit" class="btn btn-primary btn-xs p-2" name="tambahkasir">
        <i class="fa fa-plus-circle mr-1"></i> Simpan</button>
      </div>
      </form>
    </div>
  </div>
</div>

<?php include 'template/footer.php';?>
