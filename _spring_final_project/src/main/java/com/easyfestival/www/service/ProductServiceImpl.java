package com.easyfestival.www.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.easyfestival.www.domain.FavoriteVO;
import com.easyfestival.www.domain.PackageVO;
import com.easyfestival.www.domain.ProductDTO;
import com.easyfestival.www.domain.ProductFileVO;
import com.easyfestival.www.domain.ProductListDTO;
import com.easyfestival.www.repository.PackageDAO;
import com.easyfestival.www.repository.ProductFileDAO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ProductServiceImpl implements ProductService{
		
	@Inject
	private ProductFileDAO pfdao;
	
	@Inject
	private PackageDAO packdao; // 패키지

	@Override
	public int register(ProductDTO pdto) {
	
		// pkPrice 계산(비행기+호텔+축제)
		PackageVO packvo = new PackageVO();
		packvo.setPkPrice(
				pdto.getPbvo().getApPrice()+pdto.getPbvo().getFvPrice()+pdto.getPbvo().getHtPrice());
		
		// 패키지 이름 설정
		packvo.setPkName(pdto.getPbvo().getPkName());
		
		// 패키지 대륙 설정
		packvo.setPkContinent(pdto.getPbvo().getPlContinent());
		
		// 패키지 내용 설정
		packvo.setPkContent(pdto.getPbvo().getPkContent());
		
		// 패키지 insert
		packdao.register(packvo);
		
		// 제일 마지막 pkNo 값 구하기
		long pkNo = packdao.getPkno();
		
		// 구한 pkNo -> setPkno 
		pdto.getPbvo().setPkNo(pkNo);
			
		// 상품 insert
		int isUp = packdao.insertProduct(pdto.getPbvo());
			
		if(pdto.getPflist() == null) {
			isUp *= 1;
			return isUp;
		}
		if(isUp > 0 && pdto.getPflist().size() > 0){
			for(ProductFileVO pfvo : pdto.getPflist()) {
				pfvo.setPkNo(pkNo);
				isUp *= pfdao.registerFile(pfvo);
			}
		}
		
		return isUp;
	}
	@Override
	public List<ProductListDTO> getdto(String pkContinent) {
		
		List<ProductListDTO> plist = packdao.getDTO(pkContinent);;

//		log.info(plist.get(0).getAvo().getApPrice()+"aprice <<");
//		log.info(plist.get(1).getAvo().getApPrice()+"aprice <<");
		
			
		return plist;
	}
	@Override
	public List<ProductListDTO> getdtoDetail(long pkNo) {
		
		List<ProductListDTO> pdetail = packdao.getdtoDetail(pkNo);
		
		return pdetail;
	}
	@Override
	public int modify(ProductDTO pdto) {
		
		int isOk = packdao.modify(pdto.getPbvo()); // 상품수정
		
		
		
		if(pdto.getPflist() == null) {
			
			isOk *=1;
			return isOk;
		}
		
		
		if(pdto.getPflist().size() > 0 && isOk > 0) {
			for(ProductFileVO pfvo : pdto.getPflist()) {
				pfvo.setPkNo(pdto.getPbvo().getPkNo());
				isOk *= pfdao.modifyFile(pfvo); // 파일수정
			}
		}
		
		
		return isOk;
	}
	@Override
	public int removeProduct(long pkNo) {
		// TODO Auto-generated method stub
		
		int isUp = pfdao.removeFile(pkNo);
		log.info(isUp + "<< isUp");
		int isOk = packdao.removeProduct(pkNo);
		log.info(isOk + "<< isOk");
		
		
		return isOk;
	}
	@Override
	public int addFavorite(String idVal, long pkNo) {
		int isOk = packdao.addFavorite(idVal,pkNo);
		return isOk;
	}
	@Override
	public List<FavoriteVO> getFaList(String id) {
		// TODO Auto-generated method stub
		return packdao.getFaList(id);
	}
	@Override
	public int removeFavoriteRemove(long pkNo,String idVal) {
		// TODO Auto-generated method stub
		return packdao.removeFavoriteRemove(pkNo, idVal);
	}

	
	


}
