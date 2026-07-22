package utez.edu.mx.baseinteligente;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class UsuarioDao {
    private final DataSource dataSource;

    public UsuarioDao(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    public List<Usuario> listar() throws SQLException {
        List<Usuario> usuarios = new ArrayList<>();
        String sql = "SELECT ID, NOMBRE, EDAD, EMAIL, TELEFONO FROM USUARIOS";

        try (Connection conn = dataSource.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Usuario usuario = new Usuario(
                        rs.getInt("ID"),
                        rs.getString("NOMBRE"),
                        rs.getInt("EDAD"),
                        rs.getString("EMAIL"),
                        rs.getString("TELEFONO")
                );
                usuarios.add(usuario);
            }
            System.out.println("Usuarios encontrados: " + usuarios.size());
        } catch (SQLException e) {
            System.err.println("Error al consultar usuarios: " + e.getMessage());
            e.printStackTrace();
            throw e;
        }

        return usuarios;
    }
}
