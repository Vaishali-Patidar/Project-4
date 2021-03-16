package in.com.sunrays.pro4.bean;



	/**
	 * Marksheet JavaBean encapsulates Marksheet attributes
	 * @author Vaishali
	 *
	 */
	public class MarksheetBean extends BaseBean {

	   
	    private String rollNo;
	    
	    private long studentId;
	   
	    private String name;
	    
	    private Integer physics;
	    
	    private Integer chemistry;
	    
	    private Integer maths;

	   

	    public String getRollNo() {
	        return rollNo;
	    }

	    public void setRollNo(String rollNo) {
	        this.rollNo = rollNo;
	    }

	    public String getName() {
	        return name;
	    }

	    public void setName(String name) {
	        this.name = name;
	    }

	    public Integer getPhysics() {
	        return physics;
	    }

	    public void setPhysics(Integer physics) {
	        this.physics = physics;
	    }

	    public Integer getChemistry() {
	        return chemistry;
	    }

	    public void setChemistry(Integer chemistry) {
	        this.chemistry = chemistry;
	    }

	    public Integer getMaths() {
	        return maths;
	    }

	    public void setMaths(Integer maths) {
	        this.maths = maths;
	    }

	    public Long getStudentId() {
	        return studentId;
	    }

	    public void setStudentId(Long studentId) {
	        this.studentId = studentId;
	    }

	    public String getKey() {
	        return id + "";
	    }

	    public String getValue() {
	        return rollNo;
	    }

		
}
