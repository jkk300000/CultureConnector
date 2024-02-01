package com.multi.mvc.api;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.multi.mvc.culture.model.vo.CultureParent;
import com.multi.mvc.culture.model.vo.Event;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class ApiParsing {

	// url 해결해주는맵
	private static Map<String, String> urlMap;

	private static Map<String, String> keyMap;

	static {
		urlMap = new HashMap<>();
		urlMap.put("Festival", ApiSearchInfo.getFestivalURL());
		urlMap.put("TouristAttraction", ApiSearchInfo.getContentTypeURL("12") + ApiSearchInfo.getServiceKey("박현"));
		urlMap.put("Culture", ApiSearchInfo.getContentTypeURL("14") + ApiSearchInfo.getServiceKey("김진경"));
		urlMap.put("Event", ApiSearchInfo.getEventURL() + ApiSearchInfo.getServiceKey("고재목"));
		urlMap.put("Course", ApiSearchInfo.getContentTypeURL("25") + ApiSearchInfo.getServiceKey("고재목2"));
		urlMap.put("LeisureSports", ApiSearchInfo.getContentTypeURL("28") + ApiSearchInfo.getServiceKey("이병집"));
		urlMap.put("Food", ApiSearchInfo.getContentTypeURL("39") + ApiSearchInfo.getServiceKey("장성희"));

		keyMap = new HashMap<>();
		keyMap.put("TouristAttraction", "박현");
		keyMap.put("Culture", "김진경");
		keyMap.put("Event", "고재목");
		keyMap.put("LeisureSports", "이병집");
		keyMap.put("Food", "장성희");
		keyMap.put("Course", "고재목2");

	}

	// 분류없이 그냥 리스트 뽑아오는 메소드
	public static <T> List<T> parseAndExportToTheList(Class<T> targetClass) {
		String targetUrl = urlMap.get(targetClass.getSimpleName());
		List<T> list = new ArrayList<>();

		HttpURLConnection conn = null;
		try {
			URL url = new URL(targetUrl);
			conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");
//	        conn.setRequestProperty("Content-type", "application/xml");
//	        conn.setRequestProperty("Accept", "application/xml");
//	        conn.setRequestProperty("Accept", "application/json");

			int responseCode = conn.getResponseCode(); // 실제 HTTP로 호출을 시도하는 코드

			if (responseCode < 200 || 300 <= responseCode) {
				log.error("페이지가 잘못되었습니다. {}", responseCode);

			}

			try (InputStream is = conn.getInputStream();
					InputStreamReader isr = new InputStreamReader(is, "UTF-8");
					BufferedReader br = new BufferedReader(isr);) {

				// json 을 파싱하는 도구?? ObjectMapper
				ObjectMapper objMapper = new ObjectMapper();

				String line = br.readLine();
				JsonNode rootNode = objMapper.readTree(line);
				JsonNode itemsNode = rootNode.path("response").path("body").path("items").path("item");

				for (JsonNode itemNode : itemsNode) {
					T target = objMapper.treeToValue(itemNode, targetClass);
					list.add(target);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				conn.disconnect(); // 리소스 닫기
			}
		}
		return list;
	}

	// 분류없이 타겟에 상세정보까지 주입하는 메서드
	public static <T extends CultureParent> List<T> parseAndExportToTheListAdvanced(Class<T> targetClass) {
		String whosKey = keyMap.get(targetClass.getSimpleName());
		String targetUrl = urlMap.get(targetClass.getSimpleName());

		log.info("누구 키인지 {}, 유알엘 정보 {}", whosKey, targetUrl);

		List<T> list = new ArrayList<>();
		HttpURLConnection conn = null;
		try {
			URL url = new URL(targetUrl);
			conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");
//	        conn.setRequestProperty("Content-type", "application/xml");
//	        conn.setRequestProperty("Accept", "application/xml");
//	        conn.setRequestProperty("Accept", "application/json");

			int responseCode = conn.getResponseCode(); // 실제 HTTP로 호출을 시도하는 코드

			if (responseCode < 200 || 300 <= responseCode) {
				log.error("페이지가 잘못되었습니다. {}", responseCode);

			}

			try (InputStream is = conn.getInputStream();
					InputStreamReader isr = new InputStreamReader(is, "UTF-8");
					BufferedReader br = new BufferedReader(isr);) {

				// json 을 파싱하는 도구?? ObjectMapper
				ObjectMapper objMapper = new ObjectMapper();

				String line = br.readLine();
				JsonNode rootNode = objMapper.readTree(line);
				JsonNode itemsNode = rootNode.path("response").path("body").path("items").path("item");

				int count = 0;
				for (JsonNode itemNode : itemsNode) {
					log.info("{} 번째 데이터", ++count);
					String contentId = itemNode.get("contentid").asText();
					String contentTypeId = itemNode.get("contenttypeid").asText();
					try {
						// 기본 정보들 받아오는 바구니
						T common = objMapper.treeToValue(itemNode, targetClass);
						// 이미지 정보들 받아오는 리스트
						List<String> imgList = getImgList(contentId, contentTypeId, whosKey);
						// 오버뷰, 홈페이지 받아오는 메소드
						Map<String, String> overAndHomepage = getOverview(contentId, whosKey);
						// 몸통
						T target = getDetail(targetClass, contentId, contentTypeId, whosKey);
						target = commonInjection(target, common, imgList, overAndHomepage);

						if (target != null) {
							list.add(target);
						}
					} catch (JsonParseException | NullPointerException jno) {
						log.error("키 다쓴걸로 예상됨", jno);
					}

				}

			} catch (JsonParseException je) {
				log.info("{} 의 키에 문제가 생긴것으로 보입니다. url 확인해보십시오 {}", whosKey, targetUrl);
				log.error("위의 url 을 확인해보세요", je);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				conn.disconnect(); // 리소스 닫기
			}
		}
		if (list.size() == 0) {

		}
		return list;
	}

	// 분류없이 타겟에 상세정보까지 주입하는 메서드222 이름 넣는 버전
	public static <T extends CultureParent> List<T> parseAndExportToTheListAdvanced(Class<T> targetClass, String name, String page) {
		String className = targetClass.getSimpleName();
		String contentType = null;

		
		if (className.equals("Culture")) {
			contentType = "14";
		} else if (className.equals("Course")) {
			contentType = "25";
		} else if (className.equals("LeisureSports")) {
			contentType = "28";
		} else if (className.equals("Food")) {
			contentType = "39";
		} else if (className.equals("TouristAttraction")) {
			contentType = "12";
		}

		String targetUrl = null;
		if (className.equals("Event")) {
			targetUrl = ApiSearchInfo.getEventURL() + ApiSearchInfo.getServiceKey(name) + ApiSearchInfo.pageNo(page);
		} else if (className.equals("Festival")) {
			targetUrl = ApiSearchInfo.getFestivalURL() + ApiSearchInfo.getServiceKey(name) + ApiSearchInfo.pageNo(page);;
		} else {
			targetUrl = ApiSearchInfo.getContentTypeURL(contentType) + ApiSearchInfo.getServiceKey(name) + ApiSearchInfo.pageNo(page);;
		}

		log.info("누구의 키인가 {}  url 정보 : {}",name, targetUrl);
		
		List<T> list = new ArrayList<>();
		HttpURLConnection conn = null;
		try {
			URL url = new URL(targetUrl);
			conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");
//	        conn.setRequestProperty("Content-type", "application/xml");
//	        conn.setRequestProperty("Accept", "application/xml");
//	        conn.setRequestProperty("Accept", "application/json");

			int responseCode = conn.getResponseCode(); // 실제 HTTP로 호출을 시도하는 코드

			if (responseCode < 200 || 300 <= responseCode) {
				log.error("페이지가 잘못되었습니다. {}", responseCode);

			}

			try (InputStream is = conn.getInputStream();
					InputStreamReader isr = new InputStreamReader(is, "UTF-8");
					BufferedReader br = new BufferedReader(isr);) {

				// json 을 파싱하는 도구?? ObjectMapper
				ObjectMapper objMapper = new ObjectMapper();

				String line = br.readLine();
				JsonNode rootNode = objMapper.readTree(line);
				JsonNode itemsNode = rootNode.path("response").path("body").path("items").path("item");

				int count = 0;
				int keyConsumption = 0;
				for (JsonNode itemNode : itemsNode) {
					log.info("{} 번째 데이터", ++count);
					String contentId = itemNode.get("contentid").asText();
					String contentTypeId = itemNode.get("contenttypeid").asText();

					try {
						// 기본 정보들 받아오는 바구니
						T common = objMapper.treeToValue(itemNode, targetClass);
						// 이미지 정보들 받아오는 리스트
						List<String> imgList = getImgList(contentId, contentTypeId, name);
						// 오버뷰, 홈페이지 받아오는 메소드
						Map<String, String> overAndHomepage = getOverview(contentId, name);
						// 몸통
						T target = getDetail(targetClass, contentId, contentTypeId, name);
						target = commonInjection(target, common, imgList, overAndHomepage);

						if (target != null) {
							list.add(target);
						}
					} catch (JsonParseException | NullPointerException jno) {
						log.error("키 다쓴걸로 예상됨", jno);
					}
				}

			} catch (Exception e) {
				e.printStackTrace();
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				conn.disconnect(); // 리소스 닫기
			}
		}
		if (list.size() == 0) {

		}
		return list;
	}
	

	// 이미지 정보 받아오는 메소드
	private static List<String> getImgList(String contentId, String contentTypeId, String name)
			throws JsonParseException {
		String targetUrl = ApiSearchInfo.getImageURL(contentId) + ApiSearchInfo.getServiceKey(name);

		List<String> list = new ArrayList<>();

		HttpURLConnection conn = null;
		try {
			URL url = new URL(targetUrl);
			conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");
//	        conn.setRequestProperty("Content-type", "application/xml");
//	        conn.setRequestProperty("Accept", "application/xml");
//	        conn.setRequestProperty("Accept", "application/json");

			int responseCode = conn.getResponseCode(); // 실제 HTTP로 호출을 시도하는 코드

			if (responseCode < 200 || 300 <= responseCode) {
				log.error("페이지가 잘못되었습니다. {}", responseCode);
			}

			try (InputStream is = conn.getInputStream();
					InputStreamReader isr = new InputStreamReader(is, "UTF-8");
					BufferedReader br = new BufferedReader(isr);) {

				// json 을 파싱하는 도구?? ObjectMapper
				ObjectMapper objMapper = new ObjectMapper();

				String line = br.readLine();
				JsonNode rootNode = objMapper.readTree(line);
				JsonNode itemsNode = rootNode.path("response").path("body").path("items").path("item");

				for (JsonNode itemNode : itemsNode) {
					list.add(itemNode.path("originimgurl").asText());
				}

			} catch (JsonParseException je) {
				throw je;
			}

		} catch (JsonParseException je) {
			throw je;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				conn.disconnect(); // 리소스 닫기
			}
		}

		if (contentTypeId.equals("39")) {
			// 푸드면 푸드 이미지도 가져오는 로직 작성
		}

		return list;
	}

	// 하나로 합쳐주는 메소드
	private static <T extends CultureParent> T commonInjection(T target, T common, List<String> imgList,
			Map<String, String> overAndHomepage) throws NullPointerException {
			
			if(target == null) {
				return common;
			}

		int size = imgList.size();
		if (size > 20) {
			imgList = imgList.subList(0, 20);
			size = 20;
		}

		if (size != 0) {
			for (int i = 0; i < size; i++) {
				// 이미지 필드명을 동적으로 생성
				String imageFieldName = "Image" + i;
				// Reflection을 사용하여 동적으로 필드에 접근하여 값을 복사
				try {
					// target 객체의 image 필드명에 해당하는 Setter 메서드를 찾음
					Method targetSetter = target.getClass().getMethod("set" + imageFieldName, String.class);
					// 값을 복사
					targetSetter.invoke(target, imgList.get(i));
				} catch (NoSuchMethodException | IllegalAccessException | InvocationTargetException e) {
					log.error("이미지 삽입 도중 예외", e);
				}
			}

		}
		

		target.setOverview(overAndHomepage.get("overview"));
		target.setHomepage(overAndHomepage.get("homepage"));
		target.setAddr1(common.getAddr1());
		target.setAddr2(common.getAddr2());
		target.setAreacode(common.getAreacode());
		target.setBooktour(common.getBooktour());
		target.setCat1(common.getCat1());
		target.setCat2(common.getCat2());
		target.setCat3(common.getCat3());
		target.setCreatedtime(common.getCreatedtime());
		target.setFirstimage(common.getFirstimage());
		target.setFirstimage2(common.getFirstimage2());
		target.setCpyrhtDivCd(common.getCpyrhtDivCd());
		target.setMapx(common.getMapx());
		target.setMapy(common.getMapy());
		target.setMlevel(common.getMlevel());
		target.setModifiedtime(common.getModifiedtime());
		target.setSigungucode(common.getSigungucode());
		target.setTel(common.getTel());
		target.setTitle(common.getTitle());
		target.setZipcode(common.getZipcode());
		target.setShowflag(common.getShowflag());
		target.setImgCount(size);

		return target;
	}

	// 디테일한거 받아오는 메소드
	private static <T> T getDetail(Class<T> targetClass, String contentId, String contentTypeId, String name)
			throws JsonParseException {
		T target = null;
		String targetUrl = ApiSearchInfo.getDetailURL(contentId, contentTypeId) + ApiSearchInfo.getServiceKey(name);
		HttpURLConnection conn = null;
		try {
			URL url = new URL(targetUrl);
			conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");
//		        conn.setRequestProperty("Content-type", "application/xml");
//		        conn.setRequestProperty("Accept", "application/xml");
//		        conn.setRequestProperty("Accept", "application/json");

			int responseCode = conn.getResponseCode(); // 실제 HTTP로 호출을 시도하는 코드

			if (responseCode < 200 || 300 <= responseCode) {
				log.error("페이지가 잘못되었습니다. {}", responseCode);
			}

			try (InputStream is = conn.getInputStream();
					InputStreamReader isr = new InputStreamReader(is, "UTF-8");
					BufferedReader br = new BufferedReader(isr);) {

				// json 을 파싱하는 도구?? ObjectMapper
				ObjectMapper objMapper = new ObjectMapper();

				String line = br.readLine();
				JsonNode rootNode = objMapper.readTree(line);
				JsonNode itemsNode = rootNode.path("response").path("body").path("items").path("item");

				for (JsonNode itemNode : itemsNode) {
					target = objMapper.treeToValue(itemNode, targetClass);
				}

			} catch (JsonParseException je) {
				throw je;
			} catch (Exception e) {
				e.printStackTrace();
			}

		} catch (JsonParseException je) {
			throw je;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				conn.disconnect(); // 리소스 닫기
			}
		}
		return target;
	}

	// 오버뷰 받아오는 메소드
	private static Map<String, String> getOverview(String contentId, String whosKey) throws JsonParseException {
		Map<String, String> map = new HashMap<>();
		String targetUrl = ApiSearchInfo.getOverviewURL(contentId, whosKey);
		HttpURLConnection conn = null;
		try {
			URL url = new URL(targetUrl);
			conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");
//			        conn.setRequestProperty("Content-type", "application/xml");
//			        conn.setRequestProperty("Accept", "application/xml");
//			        conn.setRequestProperty("Accept", "application/json");

			int responseCode = conn.getResponseCode(); // 실제 HTTP로 호출을 시도하는 코드

			if (responseCode < 200 || 300 <= responseCode) {
				log.error("페이지가 잘못되었습니다. {}", responseCode);
			}

			try (InputStream is = conn.getInputStream();
					InputStreamReader isr = new InputStreamReader(is, "UTF-8");
					BufferedReader br = new BufferedReader(isr);) {

				// json 을 파싱하는 도구?? ObjectMapper
				ObjectMapper objMapper = new ObjectMapper();

				String line = br.readLine();
				JsonNode rootNode = objMapper.readTree(line);
				JsonNode itemsNode = rootNode.path("response").path("body").path("items").path("item");

				for (JsonNode itemNode : itemsNode) {
					map.put("overview", itemNode.path("overview").asText());
					map.put("homepage", itemNode.path("homepage").asText());
				}

			} catch (JsonParseException je) {
				throw je;
			} catch (Exception e) {
				e.printStackTrace();
			}

		} catch (JsonParseException je) {
			throw je;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				conn.disconnect(); // 리소스 닫기
			}
		}

		return map;
	}

	// 지역코드 받는것도 오버로딩
	public static <T> List<T> parseAndExportToTheList(Class<T> targetClass, String areaCode) {
		String basicUrl = urlMap.get(targetClass.getSimpleName());
		String targetUrl = basicUrl + ApiSearchInfo.areaCode(areaCode);
		List<T> list = new ArrayList<>();

		HttpURLConnection conn = null;
		try {
			URL url = new URL(targetUrl);
			conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");
//	        conn.setRequestProperty("Content-type", "application/xml");
//	        conn.setRequestProperty("Accept", "application/xml");
//	        conn.setRequestProperty("Accept", "application/json");

			int responseCode = conn.getResponseCode(); // 실제 HTTP로 호출을 시도하는 코드

			if (responseCode < 200 || 300 <= responseCode) {
				log.error("페이지가 잘못되었습니다. {}", responseCode);
			}

			try (InputStream is = conn.getInputStream();
					InputStreamReader isr = new InputStreamReader(is, "UTF-8");
					BufferedReader br = new BufferedReader(isr);) {

				// json 을 파싱하는 도구?? ObjectMapper
				ObjectMapper objMapper = new ObjectMapper();

				String line = br.readLine();
				JsonNode rootNode = objMapper.readTree(line);
				JsonNode itemsNode = rootNode.path("response").path("body").path("items").path("item");

				for (JsonNode itemNode : itemsNode) {
					T target = objMapper.treeToValue(itemNode, targetClass);
					list.add(target);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				conn.disconnect(); // 리소스 닫기
			}
		}
		return list;
	}

	// 시군구 받는것도 오버로딩
	public static <T> List<T> parseAndExportToTheList(Class<T> targetClass, String areaCode, String sigungu) {
		String basicUrl = urlMap.get(targetClass.getSimpleName());
		String targetUrl = basicUrl + ApiSearchInfo.areaCode(areaCode) + ApiSearchInfo.sigunguCode(sigungu);
		List<T> list = new ArrayList<>();

		HttpURLConnection conn = null;
		try {
			URL url = new URL(targetUrl);
			conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");
//	        conn.setRequestProperty("Content-type", "application/xml");
//	        conn.setRequestProperty("Accept", "application/xml");
//	        conn.setRequestProperty("Accept", "application/json");

			int responseCode = conn.getResponseCode(); // 실제 HTTP로 호출을 시도하는 코드

			if (responseCode < 200 || 300 <= responseCode) {
				log.error("페이지가 잘못되었습니다. {}", responseCode);
			}

			try (InputStream is = conn.getInputStream();
					InputStreamReader isr = new InputStreamReader(is, "UTF-8");
					BufferedReader br = new BufferedReader(isr);) {

				// json 을 파싱하는 도구?? ObjectMapper
				ObjectMapper objMapper = new ObjectMapper();

				String line = br.readLine();
				JsonNode rootNode = objMapper.readTree(line);
				JsonNode itemsNode = rootNode.path("response").path("body").path("items").path("item");

				for (JsonNode itemNode : itemsNode) {
					T target = objMapper.treeToValue(itemNode, targetClass);
					list.add(target);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				conn.disconnect(); // 리소스 닫기
			}
		}
		return list;
	}

	// 전국 17개 지역 별로 n 개씩 뽑는 메소드
	public static <T> List<T> listBySidoGroups(Class<T> targetClass) {
		Map<String, List<String>> areaCodeMap = areaCodeResolver();
		List<T> list = new ArrayList<>();
		for (String areaCode : areaCodeMap.keySet()) {
			list.addAll(parseAndExportToTheList(targetClass, areaCode));
		}
		return list;
	}

	// 전국 시도 전부 n 개씩 뽑는 메소드
	public static <T> List<T> listBySigunguGroups(Class<T> targetClass) {
		Map<String, List<String>> areaCodeMap = areaCodeResolver();
		List<T> list = new ArrayList<>();
		for (String areaCode : areaCodeMap.keySet()) {
			List<String> sigunguList = areaCodeMap.get(areaCode);
			for (String sigunguCode : sigunguList) {
				list.addAll(parseAndExportToTheList(targetClass, areaCode, sigunguCode));
			}
		}
		return list;
	}

	// 지역코드만 맵으로 뽑아오는 메소드
	public static Map<String, List<String>> areaCodeResolver() {
		String targetUrl = ApiSearchInfo.getAreaCodeURL();
		Map<String, List<String>> map = new HashMap<>();

		HttpURLConnection conn = null;
		try {
			URL url = new URL(targetUrl);
			conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");

			int responseCode = conn.getResponseCode();

			if (responseCode < 200 || 300 <= responseCode) {
				log.error("페이지가 잘못되었습니다. {}", responseCode);
			}
			try (InputStream is = conn.getInputStream();
					InputStreamReader isr = new InputStreamReader(is, "UTF-8");
					BufferedReader br = new BufferedReader(isr);) {

				// json 을 파싱하는 도구?? ObjectMapper
				ObjectMapper objMapper = new ObjectMapper();

				String line = br.readLine();
				JsonNode rootNode = objMapper.readTree(line);
				JsonNode itemsNode = rootNode.path("response").path("body").path("items").path("item");

				for (JsonNode itemNode : itemsNode) {
					String key = itemNode.path("code").textValue();
					map.put(key, sigunguCodeResolver(key));
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				conn.disconnect(); // 리소스 닫기
			}
		}

		return map;
	}

	// 시군구 코드 리스트로 뽑아오는 메소드
	public static List<String> sigunguCodeResolver(String areaCode) {
		String targetUrl = ApiSearchInfo.getSigunguCodeURL(areaCode);
		List<String> list = new ArrayList<>();

		HttpURLConnection conn = null;
		try {
			URL url = new URL(targetUrl);
			conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");

			int responseCode = conn.getResponseCode();

			if (responseCode < 200 || 300 <= responseCode) {
				log.error("페이지가 잘못되었습니다. {}", responseCode);
			}

			try (InputStream is = conn.getInputStream();
					InputStreamReader isr = new InputStreamReader(is, "UTF-8");
					BufferedReader br = new BufferedReader(isr);) {

				ObjectMapper objMapper = new ObjectMapper();

				String line = br.readLine();
				JsonNode rootNode = objMapper.readTree(line);
				JsonNode itemsNode = rootNode.path("response").path("body").path("items").path("item");

				for (JsonNode itemNode : itemsNode) {
					list.add(itemNode.path("code").asText());
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				conn.disconnect(); // 리소스 닫기
			}
		}
		return list;
	}

	// 코스 파싱 지옥
	public static <T extends CultureParent> List<T> courseParser(Class<T> targetClass, String name, String page){
		String targetUrl =  ApiSearchInfo.getContentTypeURL("25") + ApiSearchInfo.getServiceKey(name) + ApiSearchInfo.pageNo(page);;
		List<T> list = new ArrayList<>();
		HttpURLConnection conn = null;
		try {
			URL url = new URL(targetUrl);
			conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");
//	        conn.setRequestProperty("Content-type", "application/xml");
//	        conn.setRequestProperty("Accept", "application/xml");
//	        conn.setRequestProperty("Accept", "application/json");
			
			int responseCode = conn.getResponseCode(); // 실제 HTTP로 호출을 시도하는 코드
			
			if (responseCode < 200 || 300 <= responseCode) {
				log.error("페이지가 잘못되었습니다. {}", responseCode);
				
			}
			
			try (InputStream is = conn.getInputStream();
					InputStreamReader isr = new InputStreamReader(is, "UTF-8");
					BufferedReader br = new BufferedReader(isr);) {
				
				// json 을 파싱하는 도구?? ObjectMapper
				ObjectMapper objMapper = new ObjectMapper();
				
				String line = br.readLine();
				JsonNode rootNode = objMapper.readTree(line);
				JsonNode itemsNode = rootNode.path("response").path("body").path("items").path("item");
				
				int count = 0;
				for (JsonNode itemNode : itemsNode) {
					log.info("{} 번째 데이터",++count);
					String contentId = itemNode.get("contentid").asText();
					String contentTypeId = itemNode.get("contenttypeid").asText();
					try {
						// 몸통
						T common = objMapper.treeToValue(itemNode, targetClass);
						// 디테일 정보져오기
						T target = getDetail(targetClass, contentId, contentTypeId, name);
						// 서브 콘텐츠들 가져오기
						Map<String, CultureParent> map = getSubConMap(contentId, contentTypeId, name);
						// 오버뷰 받아오기
						Map<String, String> overviewMap = getOverview(contentId, name);
						
						target = injectionSubConName(target, common, map, overviewMap);
						
						if(target != null) {
							list.add(target);
						}
					} catch (JsonParseException | NullPointerException jno) {
						jno.printStackTrace();
					}
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if (conn != null) {
				conn.disconnect(); // 리소스 닫기
			}
		}
		return list;
	}



	// 맵에서 서브 컨텐츠 이름 세팅하고 맵주입까지 하는 메소드
	private static <T extends CultureParent> T injectionSubConName(T target, T common ,Map<String, CultureParent> map, Map<String, String> overviewMap) {
		if(map.size() == 0) {
			return null;
		}
		int count = 0;
		for (String key : map.keySet()) {
		    String subcontentid = "Subcontentid" + count;
		    String subcontenttypeid = "Subcontenttypeid" + count;
		    String subcontenttitle = "Subcontenttitle" + count;
		    String subcontentfirstimage = "Subcontentfirstimage" + count;
		    String subcontentadd1 = "Subcontentadd1" + count;
		    String subcontentadd2 = "Subcontentadd2" + count;
		    String subcontentaddmapx = "Subcontentaddmapx" + count;
		    String subcontentaddmapy = "Subcontentaddmapy" + count;
		    String subcontentaddoverview = "Subcontentaddoverview" + count;
		    String subcontentaddhomepage = "Subcontentaddhomepage" + count;

		    try {
		        CultureParent dto = map.get(key);

		        // Reflection을 사용하여 동적으로 필드에 접근하여 값을 복사
		        Method targetSubcontentidSetter = target.getClass().getMethod("set" + subcontentid, String.class);
		        targetSubcontentidSetter.invoke(target, key);

		        Method targetSubcontenttypeidSetter = target.getClass().getMethod("set" + subcontenttypeid, String.class);
		        targetSubcontentidSetter.invoke(target, key);
		        
		        Method targetSubcontenttitleSetter = target.getClass().getMethod("set" + subcontenttitle, String.class);
		        targetSubcontenttitleSetter.invoke(target, dto.getTitle());

		        Method targetSubcontentfirstimageSetter = target.getClass().getMethod("set" + subcontentfirstimage, String.class);
		        targetSubcontentfirstimageSetter.invoke(target, dto.getFirstimage());

		        Method targetSubcontentadd1Setter = target.getClass().getMethod("set" + subcontentadd1, String.class);
		        targetSubcontentadd1Setter.invoke(target, dto.getAddr1());

		        Method targetSubcontentadd2Setter = target.getClass().getMethod("set" + subcontentadd2, String.class);
		        targetSubcontentadd2Setter.invoke(target, dto.getAddr2());

		        Method targetSubcontentaddmapxSetter = target.getClass().getMethod("set" + subcontentaddmapx, String.class);
		        targetSubcontentaddmapxSetter.invoke(target, dto.getMapx());

		        Method targetSubcontentaddmapySetter = target.getClass().getMethod("set" + subcontentaddmapy, String.class);
		        targetSubcontentaddmapySetter.invoke(target, dto.getMapy());

		        Method targetSubcontentaddoverviewSetter = target.getClass().getMethod("set" + subcontentaddoverview, String.class);
		        targetSubcontentaddoverviewSetter.invoke(target, dto.getOverview());

		        Method targetSubcontentaddhomepageSetter = target.getClass().getMethod("set" + subcontentaddhomepage, String.class);
		        targetSubcontentaddhomepageSetter.invoke(target, dto.getHomepage());

		    } catch (NoSuchMethodException | IllegalAccessException | InvocationTargetException e) {
		        log.error("맵 삽입 도중 예외", e);
		    }
		    if(count == 4) {
		    	break;
		    }
		    count++;
		}
		target.setOverview(overviewMap.get("overview"));
		target.setHomepage(overviewMap.get("homepage"));
		target.setAddr1(common.getAddr1());
		target.setAddr2(common.getAddr2());
		target.setAreacode(common.getAreacode());
		target.setBooktour(common.getBooktour());
		target.setCat1(common.getCat1());
		target.setCat2(common.getCat2());
		target.setCat3(common.getCat3());
		target.setCreatedtime(common.getCreatedtime());
		target.setFirstimage(common.getFirstimage());
		target.setFirstimage2(common.getFirstimage2());
		target.setCpyrhtDivCd(common.getCpyrhtDivCd());
		target.setMapx(common.getMapx());
		target.setMapy(common.getMapy());
		target.setMlevel(common.getMlevel());
		target.setModifiedtime(common.getModifiedtime());
		target.setSigungucode(common.getSigungucode());
		target.setTel(common.getTel());
		target.setTitle(common.getTitle());
		target.setZipcode(common.getZipcode());
		target.setShowflag(common.getShowflag());
		
		return target;
	}

	// 코스 서브 콘텐츠맵 가져오는 메소드
	private static Map<String, CultureParent> getSubConMap(String contentId, String contentTypeId, String name) {
		Map<String, CultureParent> map = new LinkedHashMap<>();
		String targetUrl = new StringBuffer(ApiSearchInfo.DETAIL_URL).append(ApiSearchInfo.contentId(contentId))
				.append(ApiSearchInfo.contentTypeId(contentTypeId)).append(ApiSearchInfo.getServiceKey(name)).toString();
		HttpURLConnection conn = null;
		try {
			URL url = new URL(targetUrl);
			conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");
//	        conn.setRequestProperty("Content-type", "application/xml");
//	        conn.setRequestProperty("Accept", "application/xml");
//	        conn.setRequestProperty("Accept", "application/json");
			
			int responseCode = conn.getResponseCode(); // 실제 HTTP로 호출을 시도하는 코드
			
			if (responseCode < 200 || 300 <= responseCode) {
				log.error("페이지가 잘못되었습니다. {}", responseCode);
			}
			
			try (InputStream is = conn.getInputStream();
					InputStreamReader isr = new InputStreamReader(is, "UTF-8");
					BufferedReader br = new BufferedReader(isr);) {
				
				// json 을 파싱하는 도구?? ObjectMapper
				ObjectMapper objMapper = new ObjectMapper();
				
				String line = br.readLine();
				JsonNode rootNode = objMapper.readTree(line);
				JsonNode itemsNode = rootNode.path("response").path("body").path("items").path("item");
				
				for (JsonNode itemNode : itemsNode) {
					try {
						String subcontentid = itemNode.get("subcontentid").asText();
						map.put(subcontentid, getOnething(CultureParent.class, subcontentid, name));
						
					} catch(Exception e) {
						e.printStackTrace();
					}
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				conn.disconnect(); // 리소스 닫기
			}
		}
		
		System.out.println("맵 확인 : "+map);
		return map;
	}

	// 하나 가져오는거
	private static <T> T getOnething(Class<T> targetClass, String subcontentid, String name) {
		T target = null;
		String targetUrl = new StringBuffer(ApiSearchInfo.COMMON_URL)
				.append(ApiSearchInfo.contentId(subcontentid)).append(ApiSearchInfo.getServiceKey(name)).toString();
		HttpURLConnection conn = null;
		try {
			URL url = new URL(targetUrl);
			conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");
//	        conn.setRequestProperty("Content-type", "application/xml");
//	        conn.setRequestProperty("Accept", "application/xml");
//	        conn.setRequestProperty("Accept", "application/json");

			int responseCode = conn.getResponseCode(); // 실제 HTTP로 호출을 시도하는 코드

			if (responseCode < 200 || 300 <= responseCode) {
				log.error("페이지가 잘못되었습니다. {}", responseCode);

			}

			try (InputStream is = conn.getInputStream();
					InputStreamReader isr = new InputStreamReader(is, "UTF-8");
					BufferedReader br = new BufferedReader(isr);) {

				// json 을 파싱하는 도구?? ObjectMapper
				ObjectMapper objMapper = new ObjectMapper();

				String line = br.readLine();
				JsonNode rootNode = objMapper.readTree(line);
				JsonNode itemsNode = rootNode.path("response").path("body").path("items").path("item");

				for (JsonNode itemNode : itemsNode) {
					target = objMapper.treeToValue(itemNode, targetClass);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				conn.disconnect(); // 리소스 닫기
			}
		}
		return target;
	}
	
	
}
