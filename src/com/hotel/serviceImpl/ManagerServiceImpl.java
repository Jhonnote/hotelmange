package com.hotel.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotel.entity.Customer;
import com.hotel.entity.Management;
import com.hotel.entity.Room;
import com.hotel.entity.RoomType;
import com.hotel.mapper.ManagerMapper;
import com.hotel.service.ManagerService;

@Service
public class ManagerServiceImpl implements ManagerService {

	@Autowired
	private ManagerMapper managerMapper;

	@Override
	//查看所有用户信息
	public List<Customer> selectAllCustomer() {
		List<Customer> list = managerMapper.selectAllCustomer();
		return list;
	}

	@Override
	//查看所有房间信息
	public List<Room> findRoomInfo() {
		List<Room> list = managerMapper.findRoomInfo();
		return list;
	}
	
	@Override
	//查看所有房间类型
	public List<RoomType> findRoomType() {
		List<RoomType> list = managerMapper.findRoomType();
		return list;
	}
	
	@Override
	//增加房间类型
	public boolean addRoomType(RoomType roomType) {
		boolean result =false;
		result =  managerMapper.addRoomType(roomType) > 0;
		return result;
	}
	
	@Override
	//根据id删除房间类型
	public void deleteRoomTypeById(int id) {
		managerMapper.deleteRoomTypeById(id);
		
	}
	
	@Override
	//根据id查看房间信息
	public Room findRoomInfoById(int id) {
		return managerMapper.findRoomInfoById(id);
	}
	
	@Override
	//增加客房类型
	public boolean insertRoomType(Room room) {
		boolean result = false;
		Room rooms = new Room();
		rooms.setType(room.getType());
		rooms.setPrice(room.getPrice());
		rooms.setNumber(room.getNumber());
		rooms.setStatus(room.getStatus());
		result = managerMapper.insertRoomType(rooms) > 0;
		return result;
	}

	@Override
	public void deleteRoomById(int id) {
		managerMapper.deleteRoomById(id);
	}

	@Override
	//根据id修改房间信息
	public boolean updateRoomInfoById(Room room) {
		boolean result = false;
		result = managerMapper.updateRoomInfoById(room) > 0;
		return result;
	}

	@Override
	//查看所有员工的信息
	public List<Management> findAllEmp() {
		List<Management> list = managerMapper.findAllEmp();
		return list;
	}

	@Override
	//添加员工信息
	public boolean addEmp(Management management) {
		boolean result = false;
		result = managerMapper.addEmp(management) > 0;
		return result;
	}

	@Override
	//删除员工信息
	public void deleteEmpById(int id) {
		managerMapper.deleteEmpById(id);
	}

	@Override
	//修改员工信息
	public boolean updateEmpById(Management management) {
		boolean result = false;
		result = managerMapper.updateEmpById(management) > 0;
		return result;
	}

	@Override
	//根据id查看员工信息
	public Management findEmpById(int id) {
		Management management = managerMapper.findEmpById(id);
		return management;
	}




	
	
}
