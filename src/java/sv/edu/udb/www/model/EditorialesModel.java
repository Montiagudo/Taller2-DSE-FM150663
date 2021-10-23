/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.edu.udb.www.model;

import sv.edu.udb.www.entities.HibernateUtil;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import sv.edu.udb.www.entities.Editoriales;

public class EditorialesModel {

    SessionFactory factory = HibernateUtil.getSessionFactory();

    public int insertarEditorial(Editoriales editorial) {
        Session ses = factory.openSession();
        try {
            Transaction tran = ses.beginTransaction();
            ses.save(editorial);
            tran.commit();
            ses.close();
            return 1;
        } catch (Exception e) {
            ses.close();
            return 0;
        }
    }

    public List<Editoriales> listarEditoriales() {
        Session ses = factory.openSession();
        try {
            Query consulta = ses.createQuery("SELECT e FROM Editoriales e");
            List<Editoriales> lista = consulta.list();
            ses.close();
            return lista;
        } catch (Exception e) {
            ses.close();
            return null;
        }

    }

    public Editoriales obtenerEditorial(String codigo) {
        Session ses = factory.openSession();
        try {
            Editoriales editorial = (Editoriales) ses.get(Editoriales.class,
                    codigo);
            ses.close();
            return editorial;
        } catch (Exception e) {
            ses.close();
            return null;
        }

    }

    public int modificarEditorial(Editoriales editorial) {
        Session ses = factory.openSession();
        try {
            Transaction tran = ses.beginTransaction();
            ses.update(editorial);
            tran.commit();
            ses.close();
            return 1;
        } catch (Exception e) {
            ses.close();
            return 0;
        }
    }

    public int eliminarEditorial(String id) {
        int filasAfectadas = 0;
        Session ses = factory.openSession();
        try {
            Editoriales editorial = (Editoriales) ses.get(Editoriales.class,
                    id);
            if (editorial != null) {
                Transaction tran = ses.beginTransaction();
                ses.delete(editorial);
                tran.commit();
                filasAfectadas = 1;
            }
            ses.close();
            return filasAfectadas;
        } catch (Exception e) {
            ses.close();
            return filasAfectadas;
        }
    }

}
