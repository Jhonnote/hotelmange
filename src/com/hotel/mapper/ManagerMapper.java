package com.hotel.mapper;

import java.util.List;
import com.hotel.entity.Customer;
import com.hotel.entity.Management;
import com.hotel.entity.Room;
import com.hotel.entity.RoomType;

public interface ManagerMapper {

	//查看所有用户信息
	public List<Customer> selectAllCustomer();
	
	//查看所有房间信息
	public List<Room> findRoomInfo();
	
	//查看所有房间类型信息
	public List<RoomType> findRoomType();
	
	//增加房间类型
	public int addRoomType(RoomType roomtype);
	
	//根据id删除房间类型
	public void deleteRoomTypeById(int id);
	
	//根据id查看房间信息
	public Room findRoomInfoById(int id);
	
	//增加客房类型
	public int insertRoomType(Room room);
	
	//根据id删除房间
	public void deleteRoomById(int id);
	
	//根据id修改房间信息
	public int updateRoomInfoById(Room room);
	
	//查看所有员工的信息
	public List<Management> findAllEmp();
	
	//根据id查看员工的信息
	public Management findEmpById(int id);
	
	//添加员工信息
	public int addEmp(Management management);
	
	//修改员工信息
	public int updateEmpById(Management management);
	
	//删除员工信息
	public void deleteEmpById(int id);
	
}
