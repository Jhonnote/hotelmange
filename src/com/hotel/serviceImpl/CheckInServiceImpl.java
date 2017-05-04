package com.hotel.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotel.entity.CheckIn;
import com.hotel.entity.Customer;
import com.hotel.entity.Room;
import com.hotel.mapper.CheckInMapper;
import com.hotel.mapper.CustomerMapper;
import com.hotel.mapper.RoomMapper;
import com.hotel.service.CheckInService;
@Service
public class CheckInServiceImpl implements CheckInService {
	
	@Autowired
	private CheckInMapper checkInMapper;
	
	@Autowired
	private CustomerMapper customerMapper;
	
	@Autowired
	private RoomMapper roomMapper;
	
	@Override
	public List<CheckIn> selectStaffAll(String type) {
		// TODO Auto-generated method stub
		return checkInMapper.selectStaffAll(type);
	}

	@Override
	public boolean insertCheckIn(CheckIn checkin,String type) {
		// TODO Auto-generated method stub
	    boolean result = false;
		Customer customer = new Customer();
		customer.setName(checkin.getName());
		customer.setPhonenum(checkin.getPhonenum());
		customer.setIdcar(checkin.getIdcar());
		customerMapper.insertCustomer(customer);
		Room room = new Room();
		room.setId(checkin.getRoom_id());
		room.setStatus(type);
		roomMapper.updateRoom(room);
		room = roomMapper.seleRoomById(checkin.getRoom_id());
		if(customer.getId()!=0){
			checkin.setCustomer_id(customer.getId());
			checkin.setStatus(type);
			checkin.setPrice(room.getPrice());
			result = checkInMapper.insertCheckIn(checkin)>0;
		}
		return result;
	}

	@Override
	public CheckIn selectCheckInById(int id) {
		// TODO Auto-generated method stub
		return checkInMapper.selectCheckInById(id);
	}

	@Override
	public void checkinroom(int id) {
		// TODO Auto-generated method stub
		CheckIn checkin = checkInMapper.selectCheckInById(id);
		Room room = new Room();
		room.setId(checkin.getRoom_id());
		room.setStatus("入住");
		roomMapper.updateRoom(room);
		checkin.setStatus("入住");
		checkInMapper.updateCheckIn(checkin);
	}

	@Override
	public void checkinbilling(int id) {
		// TODO Auto-generated method stub
		CheckIn checkin = checkInMapper.selectCheckInById(id);
		Room room = new Room();
		room.setId(checkin.getRoom_id());
		room.setStatus("结账");
		roomMapper.updateRoom(room);
		checkin.setStatus("结账");
		checkInMapper.updateCheckIn(checkin);
	}

	@Override
	public boolean updateCheckIn(CheckIn checkin) {
		// TODO Auto-generated method stub
		return checkInMapper.updateCheckIn(checkin)>0;
	}

	@Override
	public List<CheckIn> selectAllCheckIn(String type) {
		// TODO Auto-generated method stub
		List<CheckIn> checkinlist = null;
		if("所有".equals(type)){
			checkinlist = checkInMapper.selectAllCheckIn();
		}else{
			checkinlist = checkInMapper.selectAllCheckIns(type);
		}
		return checkinlist;
	}

	@Override
	public String selectAmount(String type) {
		String amountall = "";
		if("所有".equals(type)){
			amountall = checkInMapper.selectAmount();
		}else{
			amountall = checkInMapper.selectAmountType(type);
		}
		// TODO Auto-generated method stub
		return amountall;
	}

}
