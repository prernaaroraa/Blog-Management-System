package com.dbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import com.dto.BlogInfo;
import com.dto.CommentInfo;
import com.dto.UserInfo;

public class DBService 
{
Connection con=null;
	public DBService()
	{
		try 
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/blog?user=root&password=root");
		}
		catch (Exception e) 
		{
			// TODO: handle exception
		}
	}
	public boolean check(UserInfo u)
	{
		boolean isValid=false;
		try 
		{
			PreparedStatement ps = con.prepareStatement("select * from userinfo where username = ? and password = ?");
			ps.setString(1, u.getUsername());
			ps.setString(2, u.getPassword());
			ResultSet rs = ps.executeQuery();
			if(rs.next()==true)
			{
				isValid = true;
			}
			else
			{
				isValid= false;
			}
		}
		catch (Exception e) 
		{
		
		}
		return isValid;
	}
	
	public int signup(UserInfo u)
	{
		int x=0;
		try 
		{
			PreparedStatement ps = con.prepareStatement("INSERT INTO userinfo (username, password, email, firstname, lastname, contact) VALUES (?,?,?,?,?,?)");
			ps.setString(1, u.getUsername());
			ps.setString(2, u.getPassword());
			ps.setString(3, u.getEmail());
			ps.setString(4, u.getFirstname());
			ps.setString(5, u.getLastname());
			ps.setString(6, u.getContactno());
			x=ps.executeUpdate();
		}
		catch (Exception e) 
		{
		
		}
		return x;
	}
	public boolean fcheck(UserInfo u)
	{
		boolean isValid=false;
		try 
		{
			PreparedStatement ps = con.prepareStatement("select * from userinfo where username = ? and email = ?");
			ps.setString(1, u.getUsername());
			ps.setString(2, u.getEmail());
			ResultSet rs = ps.executeQuery();
			if(rs.next()==true)
			{
				isValid = true;
			}
			else
			{
				isValid= false;
			}
		}
		catch (Exception e) 
		{
		
		}
		return isValid;
	}
	public int change(UserInfo u)
	{
		int x=0;
		try 
		{
			PreparedStatement ps = con.prepareStatement("update userinfo set password=? where username=?");
			ps.setString(1, u.getPassword());
			ps.setString(2, u.getUsername());
			x=ps.executeUpdate();
		}
		catch (Exception e) 
		{
		
		}
		return x;
	}
	public UserInfo getuser(String username)
	{
		UserInfo u = new UserInfo();
		try 
		{
			PreparedStatement ps = con.prepareStatement("select * from userinfo where username = ?");
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();
			if(rs.next()==true)
			{
				u.setUniqueid(rs.getInt("ID"));
				u.setUsername(rs.getString("username"));
				u.setEmail(rs.getString("email"));
				u.setFirstname(rs.getString("firstname"));
				u.setLastname(rs.getString("lastname"));
				u.setContactno(rs.getString("contact"));
				u.setPassword(rs.getString("password"));
			}
		}
		catch (Exception e) 
		{
			
		}
	return u;
	}
	public int deleteacc(String username)
	{
		int x=0;
		try 
		{
			PreparedStatement ps = con.prepareStatement("delete from userinfo where username=?");
			ps.setString(1,username);
			x=ps.executeUpdate();
		}
		catch (Exception e) 
		{
		
		}
		return x;
	}
	
	public int deleteacc(int userid)
	{
		int x=0;
		try 
		{
			PreparedStatement ps = con.prepareStatement("delete from userinfo where ID=?");
			ps.setInt(1,userid);
			x=ps.executeUpdate();
		}
		catch (Exception e) 
		{
		
		}
		return x;
	}
	public int editprofile(UserInfo u)
	{
		int x=0;
		try 
		{
			PreparedStatement ps = con.prepareStatement("update userinfo set username=?,password=?,email=?,firstname=?,lastname=?,contact=? where ID=?");
			ps.setString(1, u.getUsername());
			ps.setString(2, u.getPassword());
			ps.setString(3, u.getEmail());
			ps.setString(4, u.getFirstname());
			ps.setString(5, u.getLastname());
			ps.setString(6, u.getContactno());
			ps.setInt(7, u.getUniqueid());
			x=ps.executeUpdate();
		}
		catch (Exception e) 
		{
		
		}
		return x;
	}
	public int getid(String username)
	{
		int z=0;
		try 
		{
			PreparedStatement ps = con.prepareStatement("select ID from userinfo where username = ?");
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();
			if(rs.next()==true)
			{
				z=rs.getInt("ID");
			}
		}
		catch (Exception e) 
		{
			
		}
	return z;
	}
	public int createblog(BlogInfo b)
	{
		int x=0;
		try 
		{
			PreparedStatement ps = con.prepareStatement("INSERT INTO blog (content, title, category, userid) VALUES (?,?,?,?)");
			ps.setString(1, b.getContent());
			ps.setString(2, b.getTitle());
			ps.setString(3, b.getCategory());
			ps.setInt(4, b.getUserid());
			x=ps.executeUpdate();
		}
		catch (Exception e) 
		{
		
		}
		return x;
	}
	public ArrayList getblogs(int userid)
	{
		ArrayList<BlogInfo>al = new ArrayList<BlogInfo>();
		try 
		{
			PreparedStatement ps = con.prepareStatement("select * from blog where userid=?");
			ps.setInt(1, userid);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				BlogInfo b = new BlogInfo();
				b.setCategory(rs.getString("category"));
				b.setContent(rs.getString("content"));
				b.setTitle(rs.getString("title"));
				b.setBlogid(rs.getInt("blogid"));
				b.setUserid(userid);
				al.add(b);
			}
		}
		catch (Exception e) 
		{
			
		}
	return al;
	}
	
	public BlogInfo getblog(int blogid)
	{
		BlogInfo b =new BlogInfo();
		try 
		{
			PreparedStatement ps = con.prepareStatement("select * from blog where blogid=?");
			ps.setInt(1, blogid);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				b.setCategory(rs.getString("category"));
				b.setContent(rs.getString("content"));
				b.setTitle(rs.getString("title"));
				b.setBlogid(rs.getInt("blogid"));
				b.setUserid(rs.getInt("userid"));
			}
		}
		catch (Exception e) 
		{
			
		}
	return b;
	}
	
	public int editblog(BlogInfo b)
	{
		int x=0;
		try 
		{
			PreparedStatement ps = con.prepareStatement("update blog set content=?,title=?,category=?,userid=? where blogid=?");
			ps.setString(1, b.getContent());
			ps.setString(2, b.getTitle());
			ps.setString(3, b.getCategory());
			ps.setInt(4, b.getUserid());
			ps.setInt(5, b.getBlogid());
			x=ps.executeUpdate();
		}
		catch (Exception e) 
		{
		
		}
		return x;
	}
	
	public int deleteblog(int blogid)
	{
		int x=0;
		try 
		{
			PreparedStatement ps = con.prepareStatement("delete from blog where blogid=?");
			ps.setInt(1,blogid);
			x=ps.executeUpdate();
		}
		catch (Exception e) 
		{
		
		}
		return x;
	}
	public ArrayList getallblogs()
	{
		ArrayList<BlogInfo>al = new ArrayList<BlogInfo>();
		try 
		{
			PreparedStatement ps = con.prepareStatement("select * from blog");
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				BlogInfo b = new BlogInfo();
				b.setCategory(rs.getString("category"));
				b.setContent(rs.getString("content"));
				b.setTitle(rs.getString("title"));
				b.setBlogid(rs.getInt("blogid"));
				b.setUserid(rs.getInt("userid"));
				al.add(b);
			}
		}
		catch (Exception e) 
		{
			
		}
	return al;
	}
	
	public ArrayList getallblogs(String category)
	{
		ArrayList<BlogInfo>al = new ArrayList<BlogInfo>();
		try 
		{
			PreparedStatement ps = con.prepareStatement("select * from blog where category=?");
			ps.setString(1, category);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				BlogInfo b = new BlogInfo();
				b.setCategory(rs.getString("category"));
				b.setContent(rs.getString("content"));
				b.setTitle(rs.getString("title"));
				b.setBlogid(rs.getInt("blogid"));
				b.setUserid(rs.getInt("userid"));
				al.add(b);
			}
		}
		catch (Exception e) 
		{
			
		}
	return al;
	}
	
	public int createcomment(CommentInfo c)
	{
		int x=0;
		try 
		{
			PreparedStatement ps = con.prepareStatement("INSERT INTO comment (comment,blogid,userid) VALUES (?,?,?)");
			ps.setString(1, c.getComment());
			ps.setInt(2, c.getBlogid());
			ps.setInt(3, c.getUserid());
			x=ps.executeUpdate();
		}
		catch (Exception e) 
		{
		
		}
		return x;
	}
	
	public ArrayList getallcomment(int b)
	{
		ArrayList<CommentInfo>al = new ArrayList<CommentInfo>();
		try 
		{
			PreparedStatement ps = con.prepareStatement("select * from comment where blogid=?");
			ps.setInt(1, b);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				CommentInfo c = new CommentInfo();
				c.setUserid(rs.getInt("userid"));
				c.setCommentid(rs.getInt("commentid"));
				c.setBlogid(rs.getInt("blogid"));
				c.setComment(rs.getString("comment"));
				al.add(c);
			}
		}
		catch (Exception e) 
		{
			
		}
	return al;
	}
	
	public int deletecomment(int commentid)
	{
		int x=0;
		try 
		{
			PreparedStatement ps = con.prepareStatement("delete from comment where commentid=?");
			ps.setInt(1,commentid);
			x=ps.executeUpdate();
		}
		catch (Exception e) 
		{
		
		}
		return x;
	}
	
	public ArrayList getallusers()
	{
		ArrayList<UserInfo>al = new ArrayList<UserInfo>();
		try 
		{
			PreparedStatement ps = con.prepareStatement("select * from userinfo");
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				UserInfo u = new UserInfo();
				u.setUniqueid(rs.getInt("ID"));
				u.setUsername(rs.getString("username"));
				u.setEmail(rs.getString("email"));
				u.setFirstname(rs.getString("firstname"));
				u.setLastname(rs.getString("lastname"));
				u.setContactno(rs.getString("contact"));
				u.setPassword(rs.getString("password"));
				al.add(u);
			}
		}
		catch (Exception e) 
		{
			
		}
	return al;
	}
}