<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="utez.edu.mx.baseinteligente.Usuario" %>
<!DOCTYPE html>
<html>
<head>
    <title>Listado de Usuarios</title>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
<h1>Listado de Usuarios</h1>

<%
    List<Usuario> usuarios = (List<Usuario>) request.getAttribute("usuarios");
%>

<% if (usuarios != null && !usuarios.isEmpty()) { %>
    <div class="search-container">
        <input type="text" id="searchInput" placeholder="Buscar por ID, Nombre, Edad, Email o Teléfono...">
        <button onclick="limpiarBusqueda()">Limpiar</button>
    </div>
    <div id="noResults" class="no-results">No se encontraron resultados para la búsqueda.</div>
    
    <table id="usuariosTable">
        <thead>
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Edad</th>
                <th>Email</th>
                <th>Teléfono</th>
            </tr>
        </thead>
        <tbody>
            <% for (Usuario usuario : usuarios) { %>
                <tr>
                    <td><%= usuario.getId() %></td>
                    <td><%= usuario.getNombre() %></td>
                    <td><%= usuario.getEdad() %></td>
                    <td><%= usuario.getEmail() %></td>
                    <td><%= usuario.getTelefono() %></td>
                </tr>
            <% } %>
        </tbody>
    </table>
<% } else { %>
    <p>No hay usuarios disponibles.</p>
<% } %>

<script src="js/search.js"></script>
</body>
</html>