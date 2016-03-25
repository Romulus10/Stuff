/**
 * Sean Batzel 3/25/2016.
 */
class ThisIsReallyNotRightException extends Exception {

    //Use this to see if we can find where we're going wrong.

    @SuppressWarnings("CanBeFinal")
    String msg;

    public ThisIsReallyNotRightException(String msg) {
        this.msg = msg;
    }
}
