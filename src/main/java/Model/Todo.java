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
 * Todo generated by hbm2java
 */
@Entity
@Table(name="todo"
    ,catalog="timelive"
)
public class Todo  implements java.io.Serializable {


     private Integer todoid;
     private Tag tag;
     private Users users;
     private String descript;
     private String prio;
     private Date datetodo;
     private Boolean done;

    public Todo() {
    }

	
    public Todo(Users users, String descript, String prio, Date datetodo) {
        this.users = users;
        this.descript = descript;
        this.prio = prio;
        this.datetodo = datetodo;
    }
    public Todo(Tag tag, Users users, String descript, String prio, Date datetodo, Boolean done) {
       this.tag = tag;
       this.users = users;
       this.descript = descript;
       this.prio = prio;
       this.datetodo = datetodo;
       this.done = done;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="todoid", unique=true, nullable=false)
    public Integer getTodoid() {
        return this.todoid;
    }
    
    public void setTodoid(Integer todoid) {
        this.todoid = todoid;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="tagid")
    public Tag getTag() {
        return this.tag;
    }
    
    public void setTag(Tag tag) {
        this.tag = tag;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="userid", nullable=false)
    public Users getUsers() {
        return this.users;
    }
    
    public void setUsers(Users users) {
        this.users = users;
    }

    
    @Column(name="descript", nullable=false, length=100)
    public String getDescript() {
        return this.descript;
    }
    
    public void setDescript(String descript) {
        this.descript = descript;
    }

    
    @Column(name="prio", nullable=false, length=20)
    public String getPrio() {
        return this.prio;
    }
    
    public void setPrio(String prio) {
        this.prio = prio;
    }

    @Temporal(TemporalType.DATE)
    @Column(name="datetodo", nullable=false, length=10)
    public Date getDatetodo() {
        return this.datetodo;
    }
    
    public void setDatetodo(Date datetodo) {
        this.datetodo = datetodo;
    }

    
    @Column(name="done")
    public Boolean getDone() {
        return this.done;
    }
    
    public void setDone(Boolean done) {
        this.done = done;
    }




}

