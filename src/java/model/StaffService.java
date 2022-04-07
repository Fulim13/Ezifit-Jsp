package model;

import java.util.List;
import javax.annotation.Resource;
import javax.persistence.*;

public class StaffService {

    @PersistenceContext
    EntityManager mgr;
    @Resource
    Query query;

    public StaffService(EntityManager mgr) {
        this.mgr = mgr;
    }

    public boolean addStaff(Staff staff) {
        mgr.persist(staff);
        return true;
    }

    public boolean loginStaff(String email, String password) {
        List<Staff> staffList = mgr.createNamedQuery("Staff.findAll").getResultList();
        for (int i = 0; i < staffList.size(); i++) {
            if (email.equals(staffList.get(i).getStaffEmail()) && password.equals(staffList.get(i).getPassword())) {
                return true;

            }
        }
        return false;
    }

    public Staff findStaffById(int id) {
        Staff staff = mgr.find(Staff.class, id);
        return staff;
    }

    public boolean deleteStaff(int id) {
        Staff staff = findStaffById(id);
        if (staff != null) {
            mgr.remove(staff);
            return true;
        }
        return false;
    }

    public List<Staff> findAll() {
        List staffList = mgr.createNamedQuery("Staff.findAll").getResultList();
        return staffList;
    }

    public boolean updateStaff(Staff staff) {
        Staff tempStaff = findStaffById(staff.getStaffId());
        if (tempStaff != null) {
            tempStaff.setStaffName(staff.getStaffName());
            tempStaff.setStaffEmail(staff.getStaffEmail());
            tempStaff.setPassword(staff.getPassword());
            tempStaff.setPosition(staff.getPosition());
            return true;
        }
        return false;
    }
}
