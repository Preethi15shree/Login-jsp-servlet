import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.sql.*;

public class LoginServlet1 extends HttpServlet {
    private static final long serialVersionUID = 1L;
    Connection con;

    public void init(ServletConfig config) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/preethi", "root", "Preethi@2004");
        } catch (Exception e) {
            System.out.println("Database connection initialization error: " + e);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<meta charset=\"UTF-8\">");
        out.println("<title>Login</title>");
        out.println("<style>");
        out.println("body {");
        out.println("    font-family: 'Arial', sans-serif;");
        out.println("    display: flex;");
        out.println("    justify-content: center;");
        out.println("    align-items: center;");
        out.println("    height: 100vh;");
        out.println("    background: linear-gradient(to right, #ff758c, #ff7eb3);");
        out.println("    margin: 0;");
        out.println("}");
        out.println(".container {");
        out.println("    background: #fff;");
        out.println("    padding: 40px;");
        out.println("    border-radius: 10px;");
        out.println("    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);");
        out.println("    text-align: center;");
        out.println("}");
        out.println("a {");
        out.println("    text-decoration: none;");
        out.println("    color: #ff758c;");
        out.println("}");
        out.println("h1, p {");
        out.println("    margin: 0;");
        out.println("    padding: 10px 0;");
        out.println("}");
        out.println("</style>");
        out.println("</head>");
        out.println("<body>");
        out.println("<div class=\"container\">");

        try {
            if (con != null) {
                PreparedStatement st = con.prepareStatement("select * from users where username=? and password=?");
                st.setString(1, username);
                st.setString(2, password);
                ResultSet rs = st.executeQuery();
                if (rs.next()) {
                    String name = rs.getString("name");
                    out.println("<h1>Welcome " + name + "</h1>");
                    out.println("<p>Click <a href=\"login.jsp\">here</a> to login again</p>");
                } else {
                    out.println("<h1>Login Failure</h1>");
                    out.println("<p>Click <a href=\"login.jsp\">here</a> to try again</p>");
                }
            } else {
                out.println("<h1>Database connection is not initialized.</h1>");
            }
        } catch (Exception e) {
            out.println("<h1>Error during login: " + e + "</h1>");
        }

        out.println("</div>");
        out.println("</body>");
        out.println("</html>");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    public void destroy() {
        try {
            if (con != null) {
                con.close();
            }
        } catch (Exception e) {
            System.out.println("Error closing the database connection: " + e);
        }
    }
}
