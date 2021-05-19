package Tiw2021.Tesina00;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.PreparedQuery;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.datastore.Query.Filter;
import com.google.appengine.api.datastore.Query.FilterOperator;
import com.google.appengine.api.datastore.Query.FilterPredicate;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;
import com.google.appengine.api.utils.SystemProperty;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;


import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "HelloAppEngine", value = {"/helloTesina00"}) // , 
public class HelloAppEngine extends HttpServlet {
	
	String user="demo"; 
	String pass="demo";

  @Override
  public void doGet(HttpServletRequest request, HttpServletResponse response)
      throws IOException {

    Properties properties = System.getProperties();

    response.setContentType("text/plain");
    response.getWriter().println("Hello App Engine - Standard using "
        + SystemProperty.version.get() + " Java " + properties.get("java.specification.version"));

    
  }
  
  
  public void doPost(HttpServletRequest request, HttpServletResponse response)
	      throws IOException { 
	  	String u = "gaia";
		String p="";
		
		DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
		
		Filter f = new FilterPredicate("username",FilterOperator.EQUAL, u); // voglio la password dell'utente che ha fatto il login in questo momento
		Query q = new Query("utenti").setFilter(f); // voglio la query su utenti
		PreparedQuery pq = ds.prepare(q);
		
		//secondo me non serve
		//List<Entity> list = pq.asList(FetchOptions.Builder.withLimit(100));
		
		for (Entity result : pq.asIterable()) {
			  p = (String) result.getProperty("password");
			  u = (String) result.getProperty("Name");
			  System.out.println("Username: "+u+"Password: "+p);
			}
		
		//p = pq.toString();
		 response.getWriter().println(p);		
		 response.getWriter().println(u);
	  
	  
	  
		  // da riga 26 a 39 VA QUI O IN login.java??'
		  UserService us=UserServiceFactory.getUserService();
		  //DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
		  
		  
		//controllo così o con query?
				if(us.isUserLoggedIn() && us.isUserAdmin()) {
					 String usern = request.getParameter("username");
					 String passw = request.getParameter("password");
					Entity e = new Entity("utenti", usern); //la tabella si chiama.... e la chiave è l'username
					e.setProperty("password", passw); // aggiungo la proprietà (colonna?)
					e.setProperty("admin", false); //user NON è un admin
					ds.put(e);
				}
				
			
			
		  
		  //ricevere i parametri: ho fatto una servlet con username e password
		  String usern = request.getParameter("username"); //metto nome del campo che cerco di intercettare
		  String passw = request.getParameter("password"); //metto nome del campo che cerco di intercettare
		  
		  login log00 = new login();
		  log00.add();
		  //log00.addUser(usern, passw); //questo utente NON è un admin
		  
		  if(user.equals(usern) && pass.equals(passw)) {
			  // autenticazione è andata a buon fine
			  
			  //recupero la sessione corrente
			  HttpSession oldSession = request.getSession(false);
			  if(oldSession!=null) {
				  oldSession.invalidate(); //invalida la sessione se esiste
			  }
			  HttpSession currentSession = request.getSession(); //creo nuova sessione ( di defalut fa true
			  currentSession.setAttribute("username", usern);
			  currentSession.setAttribute("pw", p);
			  currentSession.setMaxInactiveInterval(5*60); //max 5 min di inattività
			  
			  response.sendRedirect("master.jsp");
			  
		  }else {
			  //se l'autenticazione fallisce
			  response.sendRedirect("login0.jsp");
		  }
		 
  }
  
  private UserService us;
  private DatastoreService ds;
  
  

  public static String getInfo() {
    return "Version: " + System.getProperty("java.version")
          + " OS: " + System.getProperty("os.name")
          + " User: " + System.getProperty("user.name");
  }

}
