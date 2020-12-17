package Model;
// Generated Dec 16, 2020 9:59:07 PM by Hibernate Tools 4.3.1


import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Activity generated by hbm2java
 */
@Entity
@Table(name="activity"
    ,catalog="timelive"
)
public class Activity  implements java.io.Serializable {


     private Integer acid;
     private Routines routines;
     private String activity;
     private Date timestart;
     private Date timeend;

    public Activity() {
    }

	
    public Activity(Routines routines) {
        this.routines = routines;
    }
    public Activity(Routines routines, String activity, Date timestart, Date timeend) {
       this.routines = routines;
       this.activity = activity;
       this.timestart = timestart;
       this.timeend = timeend;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="acid", unique=true, nullable=false)
    public Integer getAcid() {
        return this.acid;
    }
    
    public void setAcid(Integer acid) {
        this.acid = acid;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="routineid", nullable=false)
    public Routines getRoutines() {
        return this.routines;
    }
    
    public void setRoutines(Routines routines) {
        this.routines = routines;
    }

    
    @Column(name="activity", length=100)
    public String getActivity() {
        return this.activity;
    }
    
    public void setActivity(String activity) {
        this.activity = activity;
    }

    @Temporal(TemporalType.TIME)
    @Column(name="timestart", length=8)
    public Date getTimestart() {
        return this.timestart;
    }
    
    public void setTimestart(Date timestart) {
        this.timestart = timestart;
    }

    @Temporal(TemporalType.TIME)
    @Column(name="timeend", length=8)
    public Date getTimeend() {
        return this.timeend;
    }
    
    public void setTimeend(Date timeend) {
        this.timeend = timeend;
    }




}


