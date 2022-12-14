package com.oracle.minimalism.mjService;

import java.util.List;

import com.oracle.minimalism.dto.CartDto;
import com.oracle.minimalism.dto.OrderDto;
import com.oracle.minimalism.dto.OrderDtoVO;

public interface OrderService {
	/* 상품상세페이지에서 주문 페이지 이동 */
	public OrderDtoVO productDetailOrder(OrderDtoVO orderVo);
	
	/* 장바구니에서 여러개의 상품 주문 페이지 이동 */
	public List<CartDto> productCartList(List<String> cart_numberList);
	
	/* 상품상세페이지에서 주문하기 */
	int createProductOrder(OrderDtoVO order);

	/* 카트에서 주문하기 */
	public int createCartOrder1(OrderDtoVO order);
	public int createCartOrder2(CartDto cart);
	
	/* 주문 정보 리스트 */
	public List<OrderDto> getOrderList(String id);

	/* 주문 상세 조회 */
	OrderDto orderDetail(OrderDto orderDto);

	/* 주문 취소 */
	int cancleOrder(OrderDto order);

	


}
