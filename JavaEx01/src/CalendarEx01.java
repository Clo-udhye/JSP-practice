import java.util.Calendar;

public class CalendarEx01 {	

	public static void main(String[] args){
		// 내 코드 
		
		// 달력 만들기
		int year = 2020;
		int month = 12;

		//1일의 요일 / 마지막날(30 / 31)
		int startDayofWeek = 0;
		int endDay = 0;

		Calendar sDay = Calendar.getInstance();
		Calendar eDay = Calendar.getInstance();

		sDay.set(year, month-1, 1); // 1일
		eDay.set(year, month, 1-1); // 마지막날

		// 0 - 일요일 (Date class)
		// 1 - 일요일 (Calendar class)
		startDayofWeek = sDay.get(Calendar.DAY_OF_WEEK);
		endDay = eDay.get(Calendar.DATE);

		//System.out.println(startDayofWeek);
		//System.out.println(endDay);

		System.out.println("\t" + year + "년 "+ month + "월");
		System.out.println(" SU MO TU WE TH FR SA");

		// 1일 이전의 공백
		for(int i=1; i<startDayofWeek; i++){
			System.out.print("   ");
		}

		// 달력출력 i - 날짜출력 , n - 한주체크 
		for(int i=1, n=startDayofWeek; i<=endDay; i++, n++){
			//출력 줄 맞춤 
			System.out.print( (i<10)? "  "+ i : " " + i );  

			//토요일일때 다음 줄로 
			if( n % 7 == 0 ){
				System.out.println();
			}
		}


	}
}

