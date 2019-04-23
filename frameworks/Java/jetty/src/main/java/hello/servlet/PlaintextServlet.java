package hello.servlet;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import javax.servlet.GenericServlet;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;

import org.eclipse.jetty.http.MimeTypes;

public class PlaintextServlet extends GenericServlet
{
    byte[] helloWorld = "Hello, World!".getBytes(StandardCharsets.ISO_8859_1);
    @Override
    public void service(ServletRequest req, ServletResponse res) throws IOException
    {
        HttpServletResponse response= (HttpServletResponse)res;
        response.setContentType(MimeTypes.Type.TEXT_PLAIN.asString());
        response.getOutputStream().write(helloWorld);
    }
}
