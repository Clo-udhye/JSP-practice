import java.util.Calendar;

public class CalendarEx02 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 선생님 코드
		
		int year = 2020;
		int month = 12;
        
		int START_DAY_OF_WEEK = 0;
		int END_DAY_OF_WEEK = 0;
		int END_DAY = 0;
		
		Calendar sDay = Calendar.getInstance();
		Calendar eDay = Calendar.getInstance();
		
		sDay.set( year, month-1, 1 );
		eDay.set( year, month, 1-1 );

		START_DAY_OF_WEEK = sDay.get( Calendar.DAY_OF_WEEK );
		END_DAY_OF_WEEK = eDay.get( Calendar.DAY_OF_WEEK );
		END_DAY = eDay.get( Calendar.DATE );

		System.out.println( "      " + year + "년 " + month + "월" );
		System.out.println( " SU MO TU WE TH FR SA" );
		for( int i=1 ; i<START_DAY_OF_WEEK ; i++ ) {
			System.out.print( "   " );
		}
		for( int i=1, n=START_DAY_OF_WEEK ; i<=END_DAY ; i++, n++ ) {
			System.out.print( ( i < 10 ) ? "  " + i : " " + i );
			if( n % 7 == 0 ) System.out.println();
		}
        
		for( int i=END_DAY_OF_WEEK ; i<=6 ; i++ ) {
			System.out.print( "   " );
		}

	}

}
