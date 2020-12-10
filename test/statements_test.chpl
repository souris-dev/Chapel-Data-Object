use UnitTest;
use DatabaseCommunicationObjects;

proc main() {
    var st: Statement = new Statement("SELECT * FROM CONTACTS;");
    writeln(st.getSubstitutedStatement());

    var st2: Statement = new Statement("SELECT * FROM CONTACTS WHERE id = ?1 and name = ?2;");
    st2.setValue(1, 0);
    st2.setValue(2, "testuser");
    writeln(st2.getSubstitutedStatement());
}