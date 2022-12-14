package com.oracle.minimalism.mjDAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.minimalism.dto.CartDto;
import com.oracle.minimalism.dto.OrderDto;
import com.oracle.minimalism.dto.OrderDtoVO;

@Repository
public class OrderDaoImpl implements OrderDao {

		// Mybatis DB 연동 
		@Autowired
		private SqlSession session;
		
		public OrderDtoVO productDetailGet(OrderDtoVO orderVo) {
			System.out.println("OrderDaoImpl productDetailGet 실행");
			
			OrderDtoVO productDetailOrder = null;
			try {
				productDetailOrder = session.selectOne("productDetailOrder", orderVo);
			} catch (Exception e) {
				System.out.println("OrderDaoImpl productDetailGet Exception => " + e.getMessage());
			}
			
			return productDetailOrder;
		}
		
		@Override
		public int createProductOrder(OrderDtoVO order) {
			System.out.println("OrderDaoImpl createProductOrder 실행");
			int result = 0;
			
			try {
				result = session.insert("createOrder", order);
				session.insert("createDetailOrder", order);
			} catch (Exception e) {
				System.out.println("OrderDaoImpl createProductOrder Exception => " + e.getMessage());
			}
			return result;
		}

		/* 카트에서 주문하기 */
		@Override
		public int createCartOrder1(OrderDtoVO order) {
			System.out.println("OrderDaoImpl createCartOrder1 실행");
			int order_number = 0;

			System.out.println("order => " + order);
	
			try {
				order_number = session.insert("createOrder1", order);
				System.out.println("order.getOrder_number() => " + order.getOrder_number());
				System.out.println("order_number => " + order_number);
			} catch (Exception e) {
				System.out.println("OrderDaoImpl createCartOrder Exception => " + e.getMessage());
			}
			//order의  PK 넘겨주기
			return order.getOrder_number();
		}

		@Override
		public int createCartOrder2(CartDto cart) {
			System.out.println("OrderDaoImpl createCartOrder2 실행");
			int result = 0;

			System.out.println("cart => " + cart);

			try {
				result = session.insert("createDetailOrder", cart);
				session.delete("deleteOrderCart", cart);
			} catch (Exception e) {
				System.out.println("OrderDaoImpl createCartOrder Exception => " + e.getMessage());
			}
			return result;
		}
		
		
		@Override
		public List<OrderDto> getOrder(String id) {
			System.out.println("OrderDaoImpl getOrder 실행");
			System.out.println("OrderDaoImpl getOrder id -> " + id);
			List<OrderDto> order = null;
			
			try {
				order = session.selectList("getOrder", id);
				System.out.println("OrderDaoImpl getOrder order.size() => " + order.size());
			} catch (Exception e) {
				System.out.println("OrderDaoImpl getOrder Exception => " + e.getMessage());
			}
			return order;
		}

		@Override
		public OrderDto orderOneDetail(OrderDto orderDto) {
			System.out.println("OrderDaoImpl orderOneDetail 실행");
			OrderDto orderDetail = null;
			
			try {
				orderDetail = session.selectOne("orderOneDetail", orderDto);
				System.out.println("OrderDaoImpl orderOneDetail order_number -> " + orderDetail.getOrder_number());
			} catch (Exception e) {
				System.out.println("OrderDaoImpl orderOneDetail Exception => " + e.getMessage());
			}
			return orderDetail;
		}

		@Override
		public int cancleOrder(OrderDto order) {
			System.out.println("OrderDaoImpl cancleOrder 실행");
			System.out.println("OrderDaoImpl cancleOrder order.getOrder_number() => " + order.getOrder_number());
			
			int cancleOrder = 0;
			try {
				cancleOrder = session.update("cancleOrder", order);
				session.update("cancleDetailOrder", order);
			} catch (Exception e) {
				System.out.println("OrderDaoImpl cancleOrder Exception => " + e.getMessage());
			}
			return cancleOrder;
		}

		@Override
		public List<CartDto> cartGetList(List<String> cart_numberList) {
			System.out.println("OrderDaoImpl cartGetList 실행");
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("cart_numberList", cart_numberList); //map에 list를 넣는다.
			System.out.println("OrderDaoImpl cartGetList cart_numberList.size() -> " + cart_numberList.size());
			List<CartDto> cartList = null;
			
			try {
				cartList = session.selectList("getCartList", param);
				System.out.println("OrderDaoImpl cartGetList cart_numberList.size() => " + cart_numberList.size());
			} catch (Exception e) {
				System.out.println("OrderDaoImpl cartGetList Exception => " + e.getMessage());
			}
			
			System.out.println("OrderDaoImpl cartGetList return Before cartList) -> " + cartList);
		
			
			return cartList;
		}

}
