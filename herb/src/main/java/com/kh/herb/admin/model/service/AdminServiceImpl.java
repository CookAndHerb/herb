package com.kh.herb.admin.model.service;

<<<<<<< HEAD
=======
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
>>>>>>> refs/heads/master
import org.springframework.stereotype.Service;

<<<<<<< HEAD
=======
import com.kh.herb.admin.model.dao.AdminDAO;
import com.kh.herb.admin.model.vo.Search;
import com.kh.herb.member.model.vo.Member;
import com.kh.herb.product.model.vo.Product;
import com.kh.herb.product.model.vo.ProductFile;

>>>>>>> refs/heads/master
@Service
public class AdminServiceImpl implements AdminService {

	@Override
	public List<Member> memberList() throws Exception {
		return ad.memberList();
	}

	@Override
	public List<Member> searchMember(Search search) throws Exception {
		return ad.searchMember(search);
	}

	@Override
	public int insertFile(ProductFile pf) throws Exception {
		return ad.insertFile(pf);
	}

}
