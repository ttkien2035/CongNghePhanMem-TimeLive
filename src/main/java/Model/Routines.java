package Model;
// Generated Dec 16, 2020 9:59:07 PM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Routines generated by hbm2java
 */
@Entity
@Table(name="routines"
    ,catalog="timelive"
)
public class Routines  implements java.io.Serializable {


     private Integer rid;
     private Users users;
     private String rname;
     private Set<Weekly> weeklies = new HashSet<Weekly>(0);
     private Set<Activity> activities = new HashSet<Activity>(0);

    public Routines() {
    }

	
    public Routines(Users users, String rname) {
        this.users = users;
        this.rname = rname;
    }
    public Routines(Users users, String rname, Set<Weekly> weeklies, Set<Activity> activities) {
       this.users = users;
       this.rname = rname;
       this.weeklies = weeklies;
       this.activities = activities;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="rid", unique=true, nullable=false)
    public Integer getRid() {
        return this.rid;
    }
    
    public void setRid(Integer rid) {
        this.rid = rid;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="userid", nullable=false)
    public Users getUsers() {
        return this.users;
    }
    
    public void setUsers(Users users) {
        this.users = users;
    }

    
    @Column(name="rname", nullable=false, length=100)
    public String getRname() {
        return this.rname;
    }
    
    public void setRname(String rname) {
        this.rname = rname;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="routines")
    public Set<Weekly> getWeeklies() {
        return this.weeklies;
    }
    
    public void setWeeklies(Set<Weekly> weeklies) {
        this.weeklies = weeklies;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="routines")
    public Set<Activity> getActivities() {
        return this.activities;
    }
    
    public void setActivities(Set<Activity> activities) {
        this.activities = activities;
    }




}

