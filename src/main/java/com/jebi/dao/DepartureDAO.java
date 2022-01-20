package com.jebi.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.jebi.common.DBConnection;
import com.jebi.dto.DepartureDTO;


public class DepartureDAO {
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    public ArrayList<DepartureDTO> getDepartList(String yyyyMM){
        ArrayList<DepartureDTO> dtos = new ArrayList<>();

//		String query=" select cday,gubun,depart,arrival from departure_schedule \r\n" +
//				" where substr(cday,1,6) ='"+yyyyMM+"'"+
//		        " order by cday, gubun asc ";
        String query=" select cday,gubun,depart,arrival from departure_schedule "+
                " order by cday, gubun asc ";
        try {
            con 	= DBConnection.getConnection();
            ps 			= con.prepareStatement(query);
            rs 			= ps.executeQuery();
            while(rs.next()) {
                String cday		 = rs.getString(1);
                String gubun	 = rs.getString(2);
                String depart  	 = rs.getString(3);
                String arrival   = rs.getString(4);
                DepartureDTO dto = new DepartureDTO(cday, gubun,depart, arrival);
                dtos.add(dto);
            }
        }catch(SQLException se) {
            System.out.println("getDepartList() query ?ㅻ쪟: "+query);
        }catch(Exception ee) {
            System.out.println("getDepartList() ?ㅻ쪟");
        }finally {
            DBConnection.closeDB(con, ps, rs);
        }
        return dtos;
    }
}
