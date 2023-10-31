<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PHP Info</title>
</head>
<body>
    <h1>Hi, I'm the b server!</h1>
    <?php
        echo gethostname();
    ?>
    <?php
        phpinfo();
    ?>
</body>
</html>
