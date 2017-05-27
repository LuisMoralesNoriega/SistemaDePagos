/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BD;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author koko
 */
public class Transacciones {
    
    //Constructor de la clase 
    public Transacciones(){
       
    }
    //variable de conexion
    Connection c = null;
    Statement stmt = null;
    
    //Metodo para conexion de base de datos
    public void conexion(){
      
        try {
            Class.forName("org.postgresql.Driver");
            c = DriverManager.getConnection("jdbc:postgresql://localhost:5432/SistemaPagos","postgres", "1234");
        } catch (Exception e) {
            e.printStackTrace();
            System.err.println(e.getClass().getName()+": "+e.getMessage());
            System.exit(0);
        }
        System.out.println("Conexion Exitosa!!");
    
    }    
    
    public int SelectLogin(String pusuario, String pcontra){
        
        this.conexion();       
        try{        
            stmt = c.createStatement();
            ResultSet rs = stmt.executeQuery( "SELECT usuario, contrasenia FROM Usuario;" );
            while ( rs.next() ) {
                String  user = rs.getString("usuario");
                String  pass = rs.getString("contrasenia");
                
                if(user.equals(pusuario) && pass.equals(pcontra)){
                    return 1;                
                }    
                
             }
             rs.close();
             stmt.close();
             c.close();
          } catch ( Exception e ) {
             System.err.println( e.getClass().getName()+": "+ e.getMessage() );
             System.exit(0);
          }
        return 0;
    }
    
    
    public void InsertarRegistro(String pdpi, String pnom, String pusuario, String pcontra ){
   
       this.conexion();       
       try{           
            stmt = c.createStatement();
            String sql = "INSERT INTO public.usuario(nombre, dpi, usuario, contrasenia) VALUES ('" + pnom  + "','" + pdpi + "','" + pusuario + "','" + pcontra + "');";
            stmt.executeUpdate(sql);
            stmt.close();
            c.close();
        } catch ( Exception e ) {
            System.err.println( e.getClass().getName()+": "+ e.getMessage() );
            System.exit(0);
        }
        System.out.println("Registo de Usuario Insertado");
    
    } 
    
    
    
    
}
