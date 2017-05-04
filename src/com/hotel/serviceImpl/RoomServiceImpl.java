package com.hotel.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotel.entity.Room;
import com.hotel.mapper.RoomMapper;
import com.hotel.service.RoomService;
@Service
public class RoomServiceImpl implements RoomService {

	@Autowired
	private RoomMapper roomMapper;
	
	@Override
	public List<Room> selectRoomByAll() {
		// TODO Auto-generated method stub
		return roomMapper.selectRoomByAll();
	}

	@Override
	public List<Room> selectRoomByType(String type) {
		// TODO Auto-generated method stub
		return roomMapper.selectRoomByType(type);
	}

	@Override
	public void updateRoom(Room room) {
		// TODO Auto-generated method stub
		roomMapper.updateRoom(room);
	}

	@Override
	public Room seleRoomById(int room_id) {
		// TODO Auto-generated method stub
		return roomMapper.seleRoomById(room_id);
	}

}
