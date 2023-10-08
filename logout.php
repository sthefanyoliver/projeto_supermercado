<?php
    session_start();
    session_destroy();

    header('location: login.html', true); //segundo parametro true não reescreve o cabeçalho
?>