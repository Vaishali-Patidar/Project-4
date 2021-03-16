package in.com.sunrays.pro4.test;

import java.sql.Timestamp;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import in.com.sunrays.pro4.bean.RoleBean;
import in.com.sunrays.pro4.exception.ApplicationException;
import in.com.sunrays.pro4.exception.DuplicateRecordException;
import in.com.sunrays.pro4.model.RoleModel;

public class RoleModelTest {
	


	    public static RoleModel model = new RoleModel();

	   
	    public static void main(String[] args) throws ParseException {
	       //  testAdd();
	         //testDelete();
	         //testUpdate();
	        // testFindByPK();
	        // testFindByName();
	      //   testSearch();
	        testList();

	    }

	   
	    public static void testAdd() throws ParseException {

	        try {
	            RoleBean bean = new RoleBean();
	            // SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");

	            
	            bean.setId(1L);
	            bean.setName("Admin");
	            bean.setDescription("Admin");
	            bean.setCreatedBy("admin");
	            bean.setModifiedBy("admin");
	       	    bean.setCreatedDatetime(new Timestamp(new Date().getTime()));
	       	    bean.setModifiedDatetime(new Timestamp(new Date().getTime()));
	            long pk = model.add(bean);
	            RoleBean addedbean = model.findByPK(pk);
	            if (addedbean == null) {
	                System.out.println("Test add fail");
	            }
	        } catch (ApplicationException e) {
	            e.printStackTrace();
	        } catch (DuplicateRecordException e) {
	            e.printStackTrace();
	        }

	    }

	    
	    public static void testDelete() {

	        try {
	            RoleBean bean = new RoleBean();
	            long pk = 2L;
	            bean.setId(pk);
	            model.delete(bean);
	            RoleBean deletedbean = model.findByPK(pk);
	            if (deletedbean != null) {
	                System.out.println("Test Delete fail");
	            }
	        } catch (ApplicationException e) {
	            e.printStackTrace();
	        }
	    }

	    
	    public static void testUpdate() {

	        try {
	            RoleBean bean = model.findByPK(1L);
	            bean.setName("Student");
	            bean.setDescription("Std");
	            model.update(bean);

	            RoleBean updatedbean = model.findByPK(1L);
	            if (!"Student".equals(updatedbean.getName())) {
	                System.out.println("Test Update fail");
	            }
	        } catch (ApplicationException e) {
	            e.printStackTrace();
	        } catch (DuplicateRecordException e) {
	            e.printStackTrace();
	        }
	    }

	    
	    public static void testFindByPK() {
	        try {
	            RoleBean bean = new RoleBean();
	            long pk = 5L;
	            bean = model.findByPK(pk);
	            if (bean == null) {
	                System.out.println("Test Find By PK fail");
	            }
	            System.out.println(bean.getId());
	            System.out.println(bean.getName());
	            System.out.println(bean.getDescription());
	        } catch (ApplicationException e) {
	            e.printStackTrace();
	        }

	    }

	    
	    public static void testFindByName() {
	        try {
	            RoleBean bean = new RoleBean();
	            bean = model.findByName("admin");
	            if (bean == null) {
	                System.out.println("Test Find By PK fail");
	            }
	            System.out.println(bean.getId());
	            System.out.println(bean.getName());
	            System.out.println(bean.getDescription());
	        } catch (ApplicationException e) {
	            e.printStackTrace();
	        }
	    }

	   
	    public static void testSearch() {

	        try {
	            RoleBean bean = new RoleBean();
	            List list = new ArrayList();
	            bean.setName("student");
	            list = model.search(bean, 0, 0);
	            if (list.size() < 0) {
	                System.out.println("Test Serach fail");
	            }
	            Iterator it = list.iterator();
	            while (it.hasNext()) {
	                bean = (RoleBean) it.next();
	                System.out.println(bean.getId());
	                System.out.println(bean.getName());
	                System.out.println(bean.getDescription());
	            }

	        } catch (ApplicationException e) {
	            e.printStackTrace();
	        }

	    }

	    
	    public static void testList() {

	        try {
	            RoleBean bean = new RoleBean();
	            List list = new ArrayList();
	            list = model.list(1, 10);
	            if (list.size() < 0) {
	                System.out.println("Test list fail");
	            }
	            Iterator it = list.iterator();
	            while (it.hasNext()) {
	                bean = (RoleBean) it.next();
	                System.out.println(bean.getId());
	                System.out.println(bean.getName());
	                System.out.println(bean.getDescription());
	            }

	        } catch (ApplicationException e) {
	            e.printStackTrace();
	        }
	    }
	}


