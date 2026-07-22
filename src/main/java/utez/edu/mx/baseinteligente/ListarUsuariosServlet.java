package utez.edu.mx.baseinteligente;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.annotation.Resource;

import javax.sql.DataSource;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(urlPatterns = {"/", "/usuarios"})
public class ListarUsuariosServlet extends HttpServlet {
    @Resource(name = "jdbc/OracleCloudDB")
    private DataSource dataSource;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            UsuarioDao dao = new UsuarioDao(dataSource);
            var usuarios = dao.listar();
            
            request.setAttribute("usuarios", usuarios);
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new ServletException("Error al listar usuarios", e);
        }
    }
}
