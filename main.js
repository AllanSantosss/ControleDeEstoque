document.addEventListener("DOMContentLoaded", function () {
    const toggleButton = document.getElementById("toggle-btn");
    const sidebar = document.getElementById("sidebar");
    const sidebarExpandClass = "expand";

    // Adiciona um ouvinte de evento de clique ao botão de alternância
    toggleButton.addEventListener("click", function () {
        sidebar.classList.toggle(sidebarExpandClass);
    });

    // Adiciona um ouvinte de evento de clique a todos os ícones da barra lateral
    const sidebarIcons = document.querySelectorAll(".sidebar-link i");
    sidebarIcons.forEach(function (icon) {
        icon.addEventListener("click", function () {
            sidebar.classList.toggle(sidebarExpandClass);
        });
    });

    // Inicializa o carrossel
    $('.carousel').carousel({
        interval: 5000
    });


    
    $(document).ready(function () {
        $("#<%=FileUploadCP.ClientID%>").change(function () {
            var reader = new FileReader();
            reader.onload = function (e) {
                $("#<%=ImageCP.ClientID%>").attr('src', e.target.result);
            }
            reader.readAsDataURL(this.files[0]);
        });
    });
    




      

});