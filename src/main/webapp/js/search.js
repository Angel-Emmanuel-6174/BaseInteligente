function buscarUsuarios() {
    const searchInput = document.getElementById('searchInput').value.toLowerCase().trim();
    const table = document.getElementById('usuariosTable');
    const rows = table.getElementsByTagName('tbody')[0].getElementsByTagName('tr');
    let visibles = 0;

    for (let i = 0; i < rows.length; i++) {
        const row = rows[i];
        const cells = row.getElementsByTagName('td');
        let found = false;

        for (let j = 0; j < cells.length; j++) {
            if (cells[j].textContent.toLowerCase().includes(searchInput)) {
                found = true;
                break;
            }
        }

        if (searchInput === '' || found) {
            row.style.display = '';
            visibles++;
        } else {
            row.style.display = 'none';
        }
    }

    const noResults = document.getElementById('noResults');
    if (searchInput !== '' && visibles === 0) {
        noResults.classList.add('show');
    } else {
        noResults.classList.remove('show');
    }
}

function limpiarBusqueda() {
    document.getElementById('searchInput').value = '';
    buscarUsuarios();
    document.getElementById('searchInput').focus();
}

document.addEventListener('DOMContentLoaded', function() {
    const searchInput = document.getElementById('searchInput');
    if (searchInput) {
        searchInput.addEventListener('keyup', buscarUsuarios);
    }
});
