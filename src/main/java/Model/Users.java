package Model;
// Generated Dec 16, 2020 9:59:07 PM by Hibernate Tools 4.3.1


import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.UniqueConstraint;

/**
 * Users generated by hbm2java
 */
@Entity
@Table(name="users"
    ,catalog="timelive"
    , uniqueConstraints = @UniqueConstraint(columnNames="email") 
)
public class Users  implements java.io.Serializable {


     private Integer userid;
     private String email;
     private String pass;
     private String fullname;
     private Boolean gender;
     private Date birthdate;
     private String type;
     private Set<Tag> tags = new HashSet<Tag>(0);
     private Set<Task> tasks = new HashSet<Task>(0);
     private Set<Routines> routineses = new HashSet<Routines>(0);
     private Set<Todo> todos = new HashSet<Todo>(0);
     private Set<Weekly> weeklies = new HashSet<Weekly>(0);

    public Users() {
    }

	
    public Users(String email, String pass, String fullname) {
        this.email = email;
        this.pass = pass;
        this.fullname = fullname;
    }

    public Users(String email, String pass, String fullname, Boolean gender, Date birthdate) {
        this.email = email;
        this.pass = pass;
        this.fullname = fullname;
        this.gender = gender;
        this.birthdate = birthdate;
        this.type="user";
    }
    
    public Users(String email, String pass, String fullname, Boolean gender, Date birthdate, Set<Tag> tags, Set<Task> tasks, Set<Routines> routineses, Set<Todo> todos, Set<Weekly> weeklies) {
       this.email = email;
       this.pass = pass;
       this.fullname = fullname;
       this.gender = gender;
       this.birthdate = birthdate;
       this.tags = tags;
       this.tasks = tasks;
       this.routineses = routineses;
       this.todos = todos;
       this.weeklies = weeklies;
    }
    public Users(String email, String pass, String fullname, Boolean gender, Date birthdate, String type, Set<Tag> tags, Set<Task> tasks, Set<Routines> routineses, Set<Todo> todos, Set<Weekly> weeklies) {
       this.email = email;
       this.pass = pass;
       this.fullname = fullname;
       this.gender = gender;
       this.birthdate = birthdate;
       this.type = type;
       this.tags = tags;
       this.tasks = tasks;
       this.routineses = routineses;
       this.todos = todos;
       this.weeklies = weeklies;
    }
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="userid", unique=true, nullable=false)
    public Integer getUserid() {
        return this.userid;
    }
    
    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    
    @Column(name="email", unique=true, nullable=false, length=50)
    public String getEmail() {
        return this.email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }

    
    @Column(name="pass", nullable=false, length=30)
    public String getPass() {
        return this.pass;
    }
    
    public void setPass(String pass) {
        this.pass = pass;
    }

    
    @Column(name="fullname", nullable=false, length=50)
    public String getFullname() {
        return this.fullname;
    }
    
    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    
    @Column(name="gender")
    public Boolean getGender() {
        return this.gender;
    }
    
    public void setGender(Boolean gender) {
        this.gender = gender;
    }

    @Temporal(TemporalType.DATE)
    @Column(name="birthdate", length=10)
    public Date getBirthdate() {
        return this.birthdate;
    }
    
    public void setBirthdate(Date birthdate) {
        this.birthdate = birthdate;
    }
    @Column(name="type", length=45)
    public String getType() {
        return this.type;
    }
    
    public void setType(String type) {
        this.type = type;
    }
@OneToMany(fetch=FetchType.LAZY, mappedBy="users")
    public Set<Tag> getTags() {
        return this.tags;
    }
    
    public void setTags(Set<Tag> tags) {
        this.tags = tags;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="users")
    public Set<Task> getTasks() {
        return this.tasks;
    }
    
    public void setTasks(Set<Task> tasks) {
        this.tasks = tasks;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="users")
    public Set<Routines> getRoutineses() {
        return this.routineses;
    }
    
    public void setRoutineses(Set<Routines> routineses) {
        this.routineses = routineses;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="users")
    public Set<Todo> getTodos() {
        return this.todos;
    }
    
    public void setTodos(Set<Todo> todos) {
        this.todos = todos;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="users")
    public Set<Weekly> getWeeklies() {
        return this.weeklies;
    }
    
    public void setWeeklies(Set<Weekly> weeklies) {
        this.weeklies = weeklies;
    }
    
    
    public String returnGen()
    {
        if(this.gender==true)
        {
            return "Nam";
        }
        return "Nữ";
    }



}


