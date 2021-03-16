package in.com.sunrays.pro4.controller;

import java.io.IOException;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.com.sunrays.pro4.bean.BaseBean;
import in.com.sunrays.pro4.bean.RoleBean;
import in.com.sunrays.pro4.bean.UserBean;
import in.com.sunrays.pro4.exception.ApplicationException;
import in.com.sunrays.pro4.exception.DuplicateRecordException;
import in.com.sunrays.pro4.model.UserModel;
import in.com.sunrays.pro4.util.DataUtility;
import in.com.sunrays.pro4.util.DataValidator;
import in.com.sunrays.pro4.util.PropertyReader;
import in.com.sunrays.pro4.util.ServletUtility;



/**
 *  User registration functionality Controller. Performs operation for User
 * Registration
 * @author Vaishali
 *
 */
@ WebServlet(name="UserRegistrationCtl",urlPatterns={"/UserRegistrationCtl"})
	public class UserRegistrationCtl extends BaseCtl {

	    public static final String OP_SIGN_UP = "SignUp";

//	    private static Logger log = Logger.getLogger(UserRegistrationCtl.class);

	    @Override
	    protected boolean validate(HttpServletRequest request) {

//	        log.debug("UserRegistrationCtl Method validate Started");

	        boolean pass = true;

	        String login = request.getParameter("login");
	        String dob = request.getParameter("dob");

	        if (DataValidator.isNull(request.getParameter("firstName"))) {
	            request.setAttribute("firstName",
	                    PropertyReader.getValue("error.require", "First Name"));
	            pass = false;
	        }
	        if (DataValidator.isNull(request.getParameter("lastName"))) {
	            request.setAttribute("lastName",
	                    PropertyReader.getValue("error.require", "Last Name"));
	            pass = false;
	        }
	        if (DataValidator.isNull(login)) {
	            request.setAttribute("login",
	                    PropertyReader.getValue("error.require", "Login Id"));
	            pass = false;
	        } else if (!DataValidator.isEmail(login)) {
	            request.setAttribute("login",
	                    PropertyReader.getValue("error.email", "Login "));
	            pass = false;
	        }
	        if (DataValidator.isNull(request.getParameter("password"))) {
	            request.setAttribute("password",
	                    PropertyReader.getValue("error.require", "Password"));
	            pass = false;
	        }
	        if (DataValidator.isNull(request.getParameter("confirmPassword"))) {
	            request.setAttribute("confirmPassword", PropertyReader.getValue(
	                    "error.require", "Confirm Password"));
	            pass = false;
	        }
	        if (DataValidator.isNull(request.getParameter("gender"))) {
	            request.setAttribute("gender",
	                    PropertyReader.getValue("error.require", "Gender"));
	            pass = false;
	        }
	        if (DataValidator.isNull(dob)) {
	            request.setAttribute("dob",
	                    PropertyReader.getValue("error.require", "Date Of Birth"));
	            pass = false;
	        } else if (!DataValidator.isDate(dob)) {
	            request.setAttribute("dob",
	                    PropertyReader.getValue("error.date", "Date Of Birth"));
	            pass = false;
	        }
	        if (DataValidator.isNull(request.getParameter("mobile"))) {
	            request.setAttribute("mobile", PropertyReader.getValue("error.require", "Mobile No"));
	            pass = false;
	        }else if (!DataValidator.isMobileNo(request.getParameter("mobile"))) {
	      	  request.setAttribute("mobile", "Mobile No. must be 10 Digit and No. Series start with 6-9");
	          pass = false;
		}
	        if (!request.getParameter("password").equals(
	                request.getParameter("confirmPassword"))
	                && !"".equals(request.getParameter("confirmPassword"))) {
	            ServletUtility.setErrorMessage(
	                    "Confirm  Password  should not be matched.", request);

	            pass = false;
	        }
	//        log.debug("UserRegistrationCtl Method validate Ended");

	        return pass;
	    }

	    @Override
	    protected BaseBean populateBean(HttpServletRequest request) {

	  //      log.debug("UserRegistrationCtl Method populatebean Started");

	        UserBean bean = new UserBean();

	        bean.setId(DataUtility.getLong(request.getParameter("id")));

	        bean.setRoleId(2l);

	        bean.setFirstName(DataUtility.getString(request
	                .getParameter("firstName")));

	        bean.setLastName(DataUtility.getString(request.getParameter("lastName")));

	        bean.setLogin(DataUtility.getString(request.getParameter("login")));

	        bean.setPassword(DataUtility.getString(request.getParameter("password")));

	        bean.setConfirmPassword(DataUtility.getString(request
	                .getParameter("confirmPassword")));

	        bean.setGender(DataUtility.getString(request.getParameter("gender")));
	        bean.setMobileNo(DataUtility.getString(request.getParameter("mobile")));
	        bean.setDob(DataUtility.getDate(request.getParameter("dob")));
	       
	        
	        populateDTO(bean, request);

	     //   log.debug("UserRegistrationCtl Method populatebean Ended");

	        return bean;
	    }

	    /**
	     * Display concept of user registration
	     */
	    protected void doGet(HttpServletRequest request,
	            HttpServletResponse response) throws ServletException, IOException {
	       // log.debug("UserRegistrationCtl Method doGet Started");
	        ServletUtility.forward(getView(), request, response);

	    }

	    /**
	     * Submit concept of user registration
	     */
	    protected void doPost(HttpServletRequest request,
	            HttpServletResponse response) throws ServletException, IOException {
	        System.out.println("in get method");
	       // log.debug("UserRegistrationCtl Method doPost Started");
	        String op = DataUtility.getString(request.getParameter("operation"));
	        // get model
	        UserModel model = new UserModel();
	        long id = DataUtility.getLong(request.getParameter("id"));
	        if (OP_SIGN_UP.equalsIgnoreCase(op)) {
	            UserBean bean = (UserBean) populateBean(request);
	            try {
	                long pk = model.add(bean);
	                bean.setId(pk);
	                request.getSession().setAttribute("UserBean", bean);
	                ServletUtility.setSuccessMessage("Data is successfully saved", request);
	                ServletUtility.forward(getView(), request, response);
	                return;
	            } catch (ApplicationException e) {
	           //     log.error(e);
	                ServletUtility.handleException(e, request, response);
	                return;
	            } catch (DuplicateRecordException e) {
	         //       log.error(e);
	                ServletUtility.setBean(bean, request);
	                ServletUtility.setErrorMessage("Login id already exists",
	                        request);
	                ServletUtility.forward(getView(), request, response);
	            }
	        }else if (OP_RESET.equalsIgnoreCase(op)) {
				ServletUtility.redirect(ORSView.USER_REGISTRATION_CTL, request, response);
			}
	        
	       // log.debug("UserRegistrationCtl Method doPost Ended");
	    }

	    @Override
	    protected String getView() {
	        return ORSView.USER_REGISTRATION_VIEW;
	    }

}
