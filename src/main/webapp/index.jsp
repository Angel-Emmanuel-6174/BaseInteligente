<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="utez.edu.mx.baseinteligente.Usuario" %>
<!DOCTYPE html>
<html>
<head>
    <title>Listado de Usuarios</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        h1 {
            color: #333;
        }
        table {
            border-collapse: collapse;
            width: 100%;
            max-width: 800px;
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th {
            background-color: #4CAF50;
            color: white;
            padding: 12px;
            text-align: left;
        }
        td {
            padding: 10px;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover {
            background-color: #f0f0f0;
        }
    </style>
</head>
<body>
<h1>Listado de Usuarios</h1>

<%
    List<Usuario> usuarios = (List<Usuario>) request.getAttribute("usuarios");
%>

<% if (usuarios != null && !usuarios.isEmpty()) { %>
    <table>
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

</body>
</html>