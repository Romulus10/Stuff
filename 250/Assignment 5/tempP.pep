%PDF-1.5
%����
1 0 obj
<</Type/Catalog/Pages 2 0 R/Lang(en-US) /StructTreeRoot 29 0 R/MarkInfo<</Marked true>>>>
endobj
2 0 obj
<</Type/Pages/Count 2/Kids[ 3 0 R 23 0 R] >>
endobj
3 0 obj
<</Type/Page/Parent 2 0 R/Resources<</Font<</F1 5 0 R/F2 7 0 R/F3 12 0 R/F4 14 0 R/F5 16 0 R/F6 18 0 R>>/ProcSet[/PDF/Text/ImageB/ImageC/ImageI] >>/MediaBox[ 0 0 612 792] /Contents 4 0 R/Group<</Type/Group/S/Transparency/CS/DeviceRGB>>/Tabs/S/StructParents 0>>
endobj
4 0 obj
<</Filter/FlateDecode/Length 6509>>
stream
x��=]w���>��aO���\-�د$'�8��*��uk�'��D��%�!�N�_g���r�*����t���o�7}��w��~y�^�f/�v�_\=�W�������N�=��o��������?��~�z���˺������/XV��XV�Y#����"��/}���������O/_�P��猻@g?�����,Q7y�
$+�B�]�|����Uމ �@.���ʺ"�����p�yS���I��./x0��|Q���jv�l���0+˼�r�`1���E=:
��M[k��6��:/�ıHt�ضM[r�>���5�c�:y�(y��           .GLOBAL  BINOutpt
m:         .EQUATE  4
BINOutpt:  NOP0
           SUBSP    0,i
           STA      SAVED,d
           LDA      0,i
           STA      -2,s
           SUBSP    2,i
           LDA      SAVED,d
           STA      SAVEA,d
           STX      SAVEX,d
           LDA      m,s
           LDX      16,i
BINOloop:  NOP0
           CPX      0,i
           BREQ     BINOdone
           ROLA
           BRC      BINO1
BINO0:     CHARO    '0',i
           BR       BINOnext
BINO1:     CHARO    '1',i
BINOnext:  NOP0
           SUBX     1,i
           BR       BINOloop
BINOdone:  NOP0
           LDX      SAVEX,d
           LDA      SAVEA,d
           ADDSP    0,s
           ADDSP    2,i
           RET0
@echo off 
java MacroPP %1 > temp.pep
java Resolver temp.pep > tempR.pep
java PrettyPrinter tempR.pep > PEP.pep
dir PEP.pep
java MacroPP $1 > temp.pep
java Resolver temp.pep > tempR.pep
java PrettyPrinter tempR.pep > PEP.pep
ls PEP.pep

           .GLOBAL  DumpS
Acopy:     .BLOCK   2
Xcopy:     .BLOCK   2
display:   .BLOCK   2
actual:    .BLOCK   2
dmsg:      .ASCII   "------------------------------- DUMPS\n\x00"
cmsg:      .ASCII   ",\x00"
amsg:      .ASCII   "(A=\x00"
xmsg:      .ASCII   "(X=\x00"
dlmsg:     .ASCII   ": \x00"
DumpSN:    .EQUATE  2
DumpS:     NOP0
           STA      Acopy,d
           STX      Xcopy,d
           STRO     dmsg,d
           STA      actual,d
           STRO     amsg,d
           STA      SAVEPP,d
           LDA      actual,d
           STA      -2,s
           SUBSP    2,i
           LDA      SAVEPP,d
           CALL     HEXOutpt
           ADDSP    2,i
           STRO     cmsg,d
           DECO     actual,d
           CHARO    ')',i
           STRO     cmsg,d
           STX      actual,d
           STRO     xmsg,d
           STA      SAVEPP,d
           LDA      actual,d
           STA      -2,s
           SUBSP    2,i
           LDA      SAVEPP,d
           CALL     HEXOutpt
           ADDSP    2,i
           STRO     cmsg,d
           DECO     actual,d
           CHARO    ')',i
           CHARO    '\n',i
           LDX      DumpSN,s
           MOVSPA
           ADDA     4,i
           STA      actual,d
DumpLoop:  CPX      0,i
           BRLE     DumpDone
           STA      SAVEPP,d
           LDA      actual,d
           STA      -2,s
           SUBSP    2,i
           LDA      SAVEPP,d
           CALL     HEXOutpt
           ADDSP    2,i
           STRO     dlmsg,d
           LDA      actual,n
           STA      display,d
           STA      SAVEPP,d
           LDA      display,d
           STA      -2,s
           SUBSP    2,i
           LDA      SAVEPP,d
           CALL     HEXOutpt
           ADDSP    2,i
           STRO     cmsg,d
           DECO     display,d
           CHARO    '\n',i
           LDA      actual,d
           ADDA     2,i
           STA      actual,d
           SUBX     2,i
           BR       DumpLoop
DumpDone:  LDX      Xcopy,d
           LDA      Acopy,d
           RET0
           .GLOBAL  HEXOutpt
Hm:        .EQUATE  4
HEXtext:   .block   4
           .word    0
HEXOutpt:  NOP0
           SUBSP    0,i
           STA      SAVED,d
           LDA      0,i
           STA      -2,s
           SUBSP    2,i
           LDA      SAVED,d
           STA      SAVEA,d
           STX      SAVEX,d
           LDA      Hm,s
           LDX      3,i
HEXOloop:  NOP0
           CPX      0,i
           BRLT     HEXOdone
           ANDA     0x000F,i
           CPA      10,i
           BRLT     HEX1
           ADDA     0x0007,i
HEX1:      ADDA     0x0030,i
           STBYTEA  HEXtext,x
           LDA      Hm,s
           RORA
           RORA
           RORA
           RORA
           STA      Hm,s
           SUBX     1,i
           BR       HEXOloop
HEXOdone:  STRO     HEXtext,d
           LDX      SAVEX,d
           LDA      SAVEA,d
           ADDSP    0,s
           ADDSP    2,i
           RET0
javac PCEncrypt.java
javac MacroPP.java
javac Resolver.java
javac PrettyPrinter.javajavac PCEncrypt.java
javac MacroPP.java
javac Resolver.java
javac PrettyPrinter.java
����   4 �
 & K L
 M N	 % O P	 % Q R
  K
 S T
  U V
  W	 % X	 % Y
 S Z	 % [	 % \
 S ]	 % ^
  W
 S _ `
  a
  b	 % c d
 ����   45
 b � � �
  �
  �
  �
  �	 E �
 6 �
 6 �
 6 � �
 � �
 6 �
 6 �	 � �	 E �
 E �
 � �	 E �	 E � � �
  �
  �
 E �	 E �	 E �	 E �	 E � � �	 E �
 � �	 E �	 E �	 E �	 E �
 F �
 6 � � � �	 E � �
 6 �
 E �
 6 �	 F �
 6 �
 F �
 F �
 F � �	 E �
 E �
 E �	 E �
 6 �
  �
  �	 E �	 E �
 F �	 E �
 E �
 E �	 E � � �
 F �	 E � �	 E �	 E �
 6 �	 � �
  � �
 6 � �	 E �
 E � � � �	 E � � � �  _debug_symboll00l InnerClasses _debug_symboll00lStackIncluded Z _debug_symboll00lDefsIncluded _debug_symbol_CommentsIncluded _debug_symbol_DEFAULT_WIDTH I ConstantValue   H _debug_symbol_Width _debug_symboll Ljava/lang/String; _debug_symboll0 ll ll0 _debug_symbolll0l _debug_symbolll0l0 _debug_symboll0l0l _debug_symboll01ll0l _debug_symboll02l00l _debug_symboll30l00l #_debug_symbol_deletel0l0100lO1Files END _debug_symbol_Final ,_debug_symbol_deletel0l0100lO1FilesDELIMITER _debug_symboll0O0l _debug_symbollllll _debug_symboll0lOl0l _debug_symbolllOllOl0l    _debug_symbol_n _debug_symboll00ls [LMacroPP$_debug_symboll00l; _debug_symbol_ES [I _debug_symbol_ESTop <init> ()V Code LineNumberTable _debug_symbol_delete01l (IC)Ljava/lang/String; StackMapTable � _debug_symbol_delete0ll +(Ljava/util/Scanner;IZILjava/lang/String;)Z 
Exceptions _debug_symbol_deletel0l0100lO1 "_debug_symbol_A00000ppendLinkFiles (I)Z _debug_symbol_EStoString ()Ljava/lang/String; _debug_symboll_0_0_l_l (Ljava/lang/String;II)Z 	l_l_l_l_l (Ljava/util/Scanner;I)Z � _debug_symbol_delete0l0l (ILjava/lang/String;)Z main ([Ljava/lang/String;)V <clinit> 
SourceFile MacroPP.java � �   java/lang/StringBuilder	
	 � v o _debug_" import java.util.*; import java.io.File; import java.io.IOException; import java.util.StringTokenizer; import java.util.Iterator; public class MacroPP { static boolean _debug_symboll00lStackIncluded = true; static boolean _debug_symboll00lDefsIncluded = false; static boolean _debug_symbol_CommentsIncluded = false; final static int _debug_symbol_DEFAULT_WIDTH = 72; static int _debug_symbol_Width = _debug_symbol_DEFAULT_WIDTH; static String _debug_symboll = PCEncrypt._debug_symbol_d_debug( "_debug_ "); static String _debug_symboll0 = PCEncrypt._debug_symbol_d_debug( "_debug_\n"); static String ll = PCEncrypt._debug_symbol_d_debug( "_debug_;"); static String ll0 = PCEncrypt._debug_symbol_d_debug( "_debug_:"); static String _debug_symbolll0l = PCEncrypt._debug_symbol_d_debug( "_debug_>"); static String _debug_symbolll0l0 = PCEncrypt._debug_symbol_d_debug( "_debug_{"); static String _debug_symboll0l0l = PCEncrypt._debug_symbol_d_debug( "_debug_}"); final static String _debug_symboll01ll0l = PCEncrypt._debug_symbol_d_debug( "_debug_.INCLUDE"); final static String _debug_symboll02l00l = PCEncrypt._debug_symbol_d_debug( "_debug_.APPEND"); static final String _debug_symboll30l00l = PCEncrypt._debug_symbol_d_debug( "_debug_.GLOBAL "); static String _debug_symbol_deletel0l0100lO1Files; final static String END = PCEncrypt._debug_symbol_d_debug( "_debug_.END"); static String _debug_symbol_Final = ""; final static String _debug_symbol_deletel0l0100lO1FilesDELIMITER = PCEncrypt._debug_symbol_d_debug( "_debug_^"); final static String _debug_symboll0O0l = PCEncrypt._debug_symbol_d_debug( "_debug_.MACRO"); final static String _debug_symbollllll = PCEncrypt._debug_symbol_d_debug( "_debug_.MACROEND"); final static String _debug_symboll0lOl0l = PCEncrypt._debug_symbol_d_debug( "_debug_NOP0"); final static int _debug_symbolllOllOl0l = 256; static int _debug_symbol_n = -1; static _debug_symboll00l[] _debug_symboll00ls = new _debug_symboll00l[_debug_symbolllOllOl0l]; static class _debug_symboll00l implements Iterator { static Integer _debug_symboll0Ol0lOl0ll = new Integer(0); final String _debug_symboll0 = PCEncrypt._debug_symbol_d_debug( "_debug_\n"); final static String _debug_symbol___l0l = PCEncrypt._debug_symbol_d_debug( "_debug_#"); String Name; String _debug_symbol_A000001101l0; String _debug_symbol_0_l_1 = ""; String _debug_symbol_FA1101l0; String _debug_symbol_A00000A1101l0; StringTokenizer B; StringTokenizer _debug_symbol_A00000L, _debug_symbol_FAL, _debug_symbol_A00000AL; public _debug_symboll00l(String name, String _debug_symbol_args) { Name = name.trim() + PCEncrypt._debug_symbol_d_debug( "_debug_ ") ; _debug_symbol_A000001101l0 = _debug_symbol_args.trim(); } public void _debug_symbol_A00000ddStatement(String _debug_symbol_statement) { if(_debug_symbol_statement.trim().length() > 0) { _debug_symbol_0_l_1 = _debug_symbol_0_l_1 + _debug_symbol_statement + _debug_symboll0; } } public String Name() { return Name; } public boolean reset(String _debug_symbol_A00000ctualA1101l0) { _debug_symbol_FA1101l0 = _debug_symbol_A000001101l0; if(_debug_symbol_FA1101l0.indexOf(_debug_symbol___l0l) >= 0) { _debug_symbol_FA1101l0 = _debug_symbol_FA1101l0.replace(_debug_symbol___l0l,_debug_symboll0Ol0lOl0ll.toString()); _debug_symboll0Ol0lOl0ll = new Integer(_debug_symboll0Ol0lOl0ll.intValue()+1); } _debug_symbol_A00000A1101l0 = _debug_symbol_A00000ctualA1101l0.trim(); B = new StringTokenizer(_debug_symbol_0_l_1, PCEncrypt._debug_symbol_d_debug( "_debug_\n")); return (B.hasMoreTokens()); } public boolean hasNext() { return (B.hasMoreTokens()); } public Object next() { String loop0l0l = null; if(B.hasMoreTokens()) { loop0l0l = B.nextToken(); _debug_symbol_A00000L = new StringTokenizer(_debug_symbol_A000001101l0, PCEncrypt._debug_symbol_d_debug( "_debug_,")); _debug_symbol_FAL = new StringTokenizer(_debug_symbol_FA1101l0, PCEncrypt._debug_symbol_d_debug( "_debug_,")); _debug_symbol_A00000AL = new StringTokenizer(_debug_symbol_A00000A1101l0, PCEncrypt._debug_symbol_d_debug( "_debug_,")); while(_debug_symbol_FAL.hasMoreTokens() && _debug_symbol_A00000AL.hasMoreTokens()) { _debug_symbol_A00000L.nextToken(); loop0l0l = loop0l0l.replaceFirst(_debug_symbol_FAL.nextToken().trim(),_debug_symbol_A00000AL.nextToken().trim()); } while(_debug_symbol_A00000L.hasMoreTokens() && _debug_symbol_FAL.hasMoreTokens()) { loop0l0l = loop0l0l.replaceFirst(_debug_symbol_A00000L.nextToken().trim(),_debug_symbol_FAL.nextToken().trim()); } } return loop0l0l; } public void remove() { } } static String _debug_symbol_delete01l(int _debug_symbol_n, char _debug_symbol_c) { String loop0l0l = ""; while(_debug_symbol_n > 0) { loop0l0l = loop0l0l + _debug_symbol_c; _debug_symbol_n = _debug_symbol_n - 1; } return loop0l0l; } static boolean _debug_symbol_delete0ll (Scanner _debug_symbol_Input, int width, boolean _debug_symbol_defining, int _debug_symbol_n, String S) throws IOException { boolean loop0l0l = false; int start, stop; if(S.indexOf(_debug_symboll01ll0l) >= 0) { start = S.indexOf(_debug_symboll01ll0l) + _debug_symboll01ll0l.length(); S = S.substring(start); start = S.indexOf( PCEncrypt._debug_symbol_d_debug( "_debug_\"")); if(start >= 0) { stop = (S.lastIndexOf( PCEncrypt._debug_symbol_d_debug( "_debug_\""))); String _debug_symbol_FID = S.substring((start+1),stop); System.out.println(ll + _debug_symbol_delete01l(width,' ')); System.out.println(ll + _debug_symbolll0l0 + _debug_symboll + _debug_symbol_FID + _debug_symboll + _debug_symbol_delete01l(width-(ll.length()+2+_debug_symbol_FID.length()),'<')); loop0l0l = l_l_l_l_l(new Scanner(new File(_debug_symbol_FID)), width); System.out.println(ll + _debug_symboll0l0l + _debug_symboll + _debug_symbol_FID + _debug_symboll + _debug_symbol_delete01l(width-(ll.length()+2+_debug_symbol_FID.length()),'>')); } } return loop0l0l; } static boolean _debug_symbol_deletel0l0100lO1 (Scanner _debug_symbol_Input, int width, boolean _debug_symbol_defining, int _debug_symbol_n, String S) throws IOException { boolean loop0l0l = false; int start, stop; if(S.indexOf(_debug_symboll02l00l) >= 0) { start = S.indexOf(_debug_symboll02l00l) + _debug_symboll02l00l.length(); S = S.substring(start); start = S.indexOf( PCEncrypt._debug_symbol_d_debug( "_debug_\"")); if(start >= 0) { stop = (S.lastIndexOf( PCEncrypt._debug_symbol_d_debug( "_debug_\""))); String _debug_symbol_FID = S.substring((start+1),stop); _debug_symbol_deletel0l0100lO1Files = _debug_symbol_deletel0l0100lO1Files + _debug_symbol_FID + _debug_symbol_deletel0l0100lO1FilesDELIMITER; loop0l0l = true; } } return loop0l0l; } static boolean _debug_symbol_A00000ppendLinkFiles(int width) throws IOException { boolean loop0l0l = true; String _debug_symbol_FID; int _debug_symbol_loc; if(_debug_symbol_deletel0l0100lO1Files.length() > _debug_symbol_deletel0l0100lO1FilesDELIMITER.length()) { System.out.println( PCEncrypt._debug_symbol_d_debug( "_debug_BR STOPEND")); System.out.println(ll + _debug_symbol_delete01l(width,'<')); String _debug_symbol_Done = _debug_symbol_deletel0l0100lO1FilesDELIMITER; while(_debug_symbol_deletel0l0100lO1Files.length() > _debug_symbol_deletel0l0100lO1FilesDELIMITER.length()) { System.out.println(ll + _debug_symbol_delete01l(width,' ')); _debug_symbol_loc = _debug_symbol_deletel0l0100lO1Files.indexOf(_debug_symbol_deletel0l0100lO1FilesDELIMITER); _debug_symbol_FID = _debug_symbol_deletel0l0100lO1Files.substring(0,_debug_symbol_loc); _debug_symbol_deletel0l0100lO1Files = _debug_symbol_deletel0l0100lO1Files.substring(_debug_symbol_loc+_debug_symbol_deletel0l0100lO1FilesDELIMITER.length()); if(_debug_symbol_Done.indexOf(_debug_symbol_deletel0l0100lO1FilesDELIMITER + _debug_symbol_FID + _debug_symbol_deletel0l0100lO1FilesDELIMITER) < 0) { System.out.println(ll + _debug_symbolll0l0 + _debug_symboll + _debug_symbol_FID + _debug_symboll + _debug_symbol_delete01l(width-(ll.length()+2+_debug_symbol_FID.length()),'<')); loop0l0l = loop0l0l && l_l_l_l_l(new Scanner(new File(_debug_symbol_FID)), width); System.out.println(ll + _debug_symboll0l0l + _debug_symboll + _debug_symbol_FID + _debug_symboll + _debug_symbol_delete01l(width-(ll.length()+2+_debug_symbol_FID.length()),'>')); _debug_symbol_Done = _debug_symbol_Done + _debug_symbol_FID + _debug_symbol_deletel0l0100lO1FilesDELIMITER; } } System.out.println(ll + _debug_symbol_delete01l(width,'>')); } System.out.println( PCEncrypt._debug_symbol_d_debug( "_debug_STOPEND: STOP")); System.out.print(_debug_symbol_Final); return loop0l0l; } static String _debug_symbol_EStoString() { String result = ""; if(_debug_symboll00lStackIncluded) { for(int _debug_symbol_i=_debug_symbol_ESTop-1; _debug_symbol_i>=0; _debug_symbol_i--) { result = result + _debug_symboll00ls[_debug_symbol_ES[_debug_symbol_i]].Name().trim(); if(_debug_symbol_i > 0) result = result + PCEncrypt._debug_symbol_d_debug( "_debug_,"); } if(result.length() > 0) { result = PCEncrypt._debug_symbol_d_debug( "_debug_< ")+result+ PCEncrypt._debug_symbol_d_debug( "_debug_ >"); } } return result; } static int[] _debug_symbol_ES = new int[_debug_symbolllOllOl0l]; static int _debug_symbol_ESTop = 0; static boolean _debug_symboll_0_0_l_l(String S, int width, int _debug_symbol_n) throws IOException { boolean _debug_symbol_found=false; int pos; int _debug_symbol_loc; String Label = ""; String _debug_symbol_A00000ctualA1101l0; pos = S.indexOf(ll0); if(pos >= 0) { Label = S.substring(0,pos+1); S = S.substring(pos+1); } S = S.trim(); for(int _debug_symbol_i=_debug_symbol_n; !_debug_symbol_found && (_debug_symbol_i>=0); _debug_symbol_i--) { if(S.length() < _debug_symboll00ls[_debug_symbol_i].Name().length()) { S = S + PCEncrypt._debug_symbol_d_debug( "_debug_ "); } if(S.startsWith(_debug_symboll00ls[_debug_symbol_i].Name())) { _debug_symbol_found = true; String _debug_symbol_Head = ll + ll + Label + S + PCEncrypt._debug_symbol_d_debug( "_debug_ ") + ll; if(_debug_symbol_ESTop > 0) _debug_symbol_Head = _debug_symbol_Head + _debug_symbol_EStoString(); _debug_symbol_ES[_debug_symbol_ESTop] = _debug_symbol_i; _debug_symbol_ESTop = _debug_symbol_ESTop + 1; _debug_symbol_Head = _debug_symbol_Head.replaceFirst( PCEncrypt._debug_symbol_d_debug( "_debug_ "), "") + ' '; System.out.println(_debug_symbol_Head); S = S + ll; int _debug_symboll00lNameLength = _debug_symboll00ls[_debug_symbol_i].Name.length(); int _debug_symbol_indexOfComment = S.indexOf(ll,_debug_symboll00lNameLength); if(_debug_symbol_indexOfComment < 0) _debug_symbol_indexOfComment = S.length(); _debug_symbol_A00000ctualA1101l0 = S.substring(_debug_symboll00lNameLength,_debug_symbol_indexOfComment); _debug_symboll00ls[_debug_symbol_i].reset(_debug_symbol_A00000ctualA1101l0); boolean first = true; while(_debug_symboll00ls[_debug_symbol_i].hasNext()) { S = (String)_debug_symboll00ls[_debug_symbol_i].next(); if(first) { if(Label.length() > 0) { System.out.println(Label+ PCEncrypt._debug_symbol_d_debug( "_debug_ ")+_debug_symboll0lOl0l+ PCEncrypt._debug_symbol_d_debug( "_debug_ ")+ll+_debug_symbol_EStoString()); } first = false; } S = S.trim(); if(!_debug_symbol_delete0ll(null, width, false, _debug_symbol_n, S) && !_debug_symboll_0_0_l_l(S,width,_debug_symbol_n)) { String _debug_symbol_Pre, _debug_symbol_Post; _debug_symbol_loc = S.indexOf(ll); if(_debug_symbol_loc >= 0) { _debug_symbol_Pre = S.substring(0,_debug_symbol_loc); _debug_symbol_Post = S.substring(_debug_symbol_loc); } else { _debug_symbol_Pre = S; _debug_symbol_Post = ""; } String _debug_symbol_Tag = _debug_symbol_EStoString(); S = _debug_symbol_Pre + ll + _debug_symbol_Tag; if(_debug_symbol_CommentsIncluded) { S = S + _debug_symbol_Post; } if(S.equals(ll+_debug_symbol_Tag)) { S = ""; } if(S.length() > 0) { System.out.println(S); } } } _debug_symbol_ESTop = _debug_symbol_ESTop - 1; } } return _debug_symbol_found; } static boolean l_l_l_l_l(Scanner _debug_symbol_Input, int width) throws IOException { boolean _debug_symbol_defining = false; boolean loop0l0l = false; loop0l0l = true; String S; int start, stop; while (_debug_symbol_Input.hasNext()) { S = _debug_symbol_Input.nextLine().trim(); if(_debug_symbol_defining) { if(S.indexOf(_debug_symbollllll) >= 0) { _debug_symbol_defining = false; } else if(S.length() > 0) { _debug_symboll00ls[_debug_symbol_n]._debug_symbol_A00000ddStatement(S); } } else if(S.indexOf(END) < 0) { if(_debug_symbol_delete0l0l(width,S)) { } else if(_debug_symbol_delete0ll(_debug_symbol_Input, width, _debug_symbol_defining, _debug_symbol_n, S)) { } else if(_debug_symbol_deletel0l0100lO1(_debug_symbol_Input, width, _debug_symbol_defining, _debug_symbol_n, S)) { } else if(S.indexOf(_debug_symboll0O0l) >= 0) { _debug_symbol_defining = true; start = S.indexOf(_debug_symboll0O0l) + _debug_symboll0O0l.length(); S = S.substring(start).trim() + PCEncrypt._debug_symbol_d_debug( "_debug_ "); stop = S.indexOf( PCEncrypt._debug_symbol_d_debug( "_debug_ ")); String _debug_symboll00lName = S.substring(0,stop); String _debug_symboll00lArgs = S.substring(stop).trim(); if(_debug_symbol_n < _debug_symbolllOllOl0l) { _debug_symbol_n = _debug_symbol_n + 1; _debug_symboll00ls[_debug_symbol_n] = new _debug_symboll00l(_debug_symboll00lName.trim(),_debug_symboll00lArgs.trim()); } if(_debug_symboll00lDefsIncluded) { System.out.println(ll + _debug_symboll0O0l+ PCEncrypt._debug_symbol_d_debug( "_debug_ ")+_debug_symboll00lName+ PCEncrypt._debug_symbol_d_debug( "_debug_ ")+_debug_symboll00lArgs); } } else { if(!_debug_symboll_0_0_l_l(S,width,_debug_symbol_n)) { if(S.length() > 0) { System.out.println(S); } } } } else { _debug_symbol_Final = _debug_symbol_Final + S + PCEncrypt._debug_symbol_d_debug( "_debug_\n"); } } return loop0l0l; } public static boolean _debug_symbol_delete0l0l(int width, String S) { boolean result = false; int index = S.indexOf(_debug_symboll30l00l); if(index >= 0) { int _debug_symbol_indexNL = S.lastIndexOf(_debug_symboll0,index); int _debug_symbol_indexll = S.lastIndexOf(ll,index); if(_debug_symbol_indexNL >= _debug_symbol_indexll) { result = true; System.out.println(ll + S); } } return result; } public static void main (String[] _debug_symbol_args) throws IOException { Scanner _debug_symbol_Standard = new Scanner(System.in); final char _debug_symboll = ' '; char _debug_symbol_c; if(_debug_symbol_args.length > 0) { _debug_symbol_Standard = new Scanner(new File(_debug_symbol_args[0])); if(_debug_symbol_args.length > 1) { _debug_symboll00lStackIncluded = _debug_symbol_args[1].equalsIgnoreCase( PCEncrypt._debug_symbol_d_debug( "_debug_true")); if(_debug_symbol_args.length > 2) { ll = _debug_symbol_args[2]; _debug_symboll00lDefsIncluded = ((_debug_symbol_args.length > 3) && (_debug_symbol_args[3].equalsIgnoreCase( PCEncrypt._debug_symbol_d_debug( "_debug_true")))); _debug_symbol_CommentsIncluded = ((_debug_symbol_args.length > 4) && (_debug_symbol_args[4].equalsIgnoreCase( PCEncrypt._debug_symbol_d_debug( "_debug_true")))); } } } System.out.println(ll+ PCEncrypt._debug_symbol_d_debug( "_debug_PMJ's MPP ver2012.0 ...")); _debug_symbol_deletel0l0100lO1Files = ""; l_l_l_l_l(_debug_symbol_Standard, _debug_symbol_Width); _debug_symbol_A00000ppendLinkFiles(_debug_symbol_Width); } }
README For those of you using Macs:

The Install.bat, pretty.bat and build.bat files are meant for Windows users. 
So I've created versions for you to use;  InstallA, prettyA and buildA are the
filenames.  You may need to change the file protections first though.

   chmod 0755 InstallA
   chmod 0755 prettyA
   chmod 0755 buildA

And to run them you may need to prefix the command with the current
location;  as in.

  ./InstallA

Hope this is helpful.
P.M.J. - March 26, 2012
 
;-----------------------------------------------------------
; void memcpy(byte *from, byte *to, int n);
;-----------------------------------------------------------
from:      .EQUATE  2
to:        .EQUATE  4
n:         .EQUATE  6
;-----------------------------------------------------------
;-----------------------------------------------------------
           .GLOBAL  memcpy
memcpy:    SAVE
           CLRA
           CLRX
loop:      CPX      n,s
           BRGE     done
           LDBYTEA  from,sxf
           STBYTEA  to,sxf
           INCX
           BR       loop
done:      RESTORE
           RET0
           .GLOBAL    MUL
;*******************************
;***Multiplication Subprogram***
;*******************************
;**Parameters
t1:        .EQUATE    6
t2:        .EQUATE    8
;**Local Variables
sign:      .EQUATE    0
n:         .EQUATE    2
;*******************************
MUL:       LDA        16,i
           STA        -2,s
           SUBSP      2,i
           LDA        1,i
           STA        -2,s
           SUBSP      2,i
TestT1:    NOP0
           LDA        t1,s
           CPA        0,i
           BRGE       TestT2
           STA        SAVEA,d
           LDA        sign,s
           SUBA       1,i
           STA        sign,s
           LDA        SAVEA,d
TestT2:    NOP0
           LDA        t2,s
           CPA        0,i
           BRGE       InitMul
           STA        SAVEA,d
           LDA        sign,s
           SUBA       1,i
           STA        sign,s
           LDA        SAVEA,d
InitMul:   LDA        0,i
           LDX        t2,s
MulLoop:   STA        -2,s
           LDA        n,s
           BREQ       Fin
           LDA        -2,s
           RORX
           BRC        ml0
           BR         MulShftP
ml0:       NOP0
           ROLX
           ADDA       t1,s
           BR         MulShft
MulShftP:  ROLX
MulShft:   ASRX
           RORA
           BRC        LAB1
           ROLA
           ANDX       0x7FFF,i
           BR         LAB2
LAB1:      ROLA
           ORX        0x8000,i
LAB2:      ASRA
MulLoop3:  STA        -2,s
           STA        SAVEA,d
           LDA        n,s
           SUBA       1,i
           STA        n,s
           LDA        SAVEA,d
           LDA        -2,s
           BR         MulLoop
Fin:       STX        -2,s
           LDA        -2,s
           LDX        sign,s
           STA        -2,s
oVrTest1:  NOP0
           LDA        sign,s
           CPA        0,i
           BRNE       oVrTest2
           LDA        -2,s
           CPA        0,i
           BRGT       OverErr
           BR         Fin2
oVrTest2:  LDA        -2,s
           CPA        0,i
           BRLT       OverErr
           BR         Fin2
OverErr:   ADDSP      4,i
           LDA        0x7FFF,i
           ADDA       1,i
           BR         RetMul
Fin2:      ADDSP      4,i
RetMul:    RET0
����   4 S
  +
  ,
  - .
  + /	  0
  1
  2
  3	  4
  5
  6 7
  8
  9 :
  +
  ;
  <
  =	  > ? @ _debug_symbol_cc [C _debug_symbol_deckey Ljava/lang/String; _debug_symbol_delim <init> ()V Code LineNumberTable _debug_symbol_d_debug &(Ljava/lang/String;)Ljava/lang/String; _debug_symbol_d StackMapTable . / <clinit> 
SourceFile PCEncrypt.java   A B C D java/lang/String java/util/StringTokenizer  import java.util.StringTokenizer; /**/ public class PCEncrypt /**/ { /**/ static char _debug_symbol_cc[] = {'1','4','3','8','6','0','8','4','3'}; /**/ static String _debug_symbol_deckey = new String(_debug_symbol_cc); /**/ static char _debug_symbol_delim[] = {'x'}; /**/ public static String _debug_symbol_d_debug(String _debug_symbol_string) /**/ { /**/ return _debug_symbol_string.substring(7,_debug_symbol_string.length()); /**/ } /**/ public static String _debug_symbol_d(String _debug_symbol_string) /**/ { /**/ String _debug_symbol_sRet = new String(); /**/ StringTokenizer _debug_symbol_tok = new StringTokenizer(_debug_symbol_string,new String(_debug_symbol_delim) ); /**/ int _debug_symbol_nCh = _debug_symbol_tok.countTokens(); /**/ for( int _debug_symbol_i=0;_debug_symbol_i<_debug_symbol_nCh;++_debug_symbol_i) /**/ { /**/ int _debug_symbol_keyIdx = _debug_symbol_i%_debug_symbol_deckey.length(); /**/ int _debug_symbol_keyVal = _debug_symbol_deckey.charAt(_debug_symbol_keyIdx); /**/ String _debug_symbol_sTok = _debug_symbol_tok.nextToken(); /**/ int _debug_symbol_chVal = new Integer(_debug_symbol_sTok).intValue(); /**/ _debug_symbol_chVal=_debug_symbol_chVal-_debug_symbol_keyVal; /**/ _debug_symbol_sRet+=String.valueOf((char)_debug_symbol_chVal); /**/ } /**/ return _debug_symbol_sRet; /**/ } /**/ } /**/ /**/
;PMJ's MPP ver2012.0 ...
           br        main
;
;{ PEP2.pep1 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
;-------------------------------------------------------------------
; Global "low memory" locations used for temporary static storage
;.GLOBAL    TEMP
TEMP:      .BLOCK    4
;.GLOBAL    JUNK
JUNK:      .BLOCK    2
;.GLOBAL    SAVED
SAVED:     .BLOCK    2
;.GLOBAL    SAVEA
SAVEA:     .BLOCK    2                                              ;where A is saved statically
;.GLOBAL    SAVEX
SAVEX:     .BLOCK    2                                              ;where X is saved statically
;.GLOBAL    SAVEPP
SAVEPP:    .BLOCK    2
;============================================================
;============================================================
;============================================================
;-------------------------------------------------------------CC Corruption
; Macro to dump the top portion of the stack
;============================================================
;} PEP2.pep1 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
null:      .EQUATE   x00
one:       .BLOCK    31
two:       .BLOCK    31
main:      NOP0
loop:      STRI      one,d
           STRI      two,d
           LDA       one,dxf
           CPA       null,d
           BREQ      done
           PUSH      one,d
           PUSH      two,d
           CALL      SCompTo
           BR        loop
done:      STOP
           BR        STOPEND
;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
;
;{ STRInput.pep1 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
;.GLOBAL  STRInput
STRInput:  NOP0
Sobject:   .EQUATE   6
capacity:  .EQUATE   0
ignored:   .EQUATE   2
           SUBSP     4,i
           LDA       0,i
           STA       ignored,s
           LDX       -1,i
           LDA       0,i
           LDBYTEA   Sobject,sxf
           STA       capacity,s
           LDX       0,i
           CPX       capacity,s
           BRGE      error
           LDA       0,i
LL0:       CPX       capacity,s
           BREQ      full
           CHARI     Sobject,sxf
           LDBYTEA   Sobject,sxf
           CPA       '\n',i
           BREQ      LL1
           ADDX      1,i
           BR        LL0
full:      LDA       ignored,s
           ADDA      1,i
           STA       ignored,s
           SUBX      1,i
ignore:    CHARI     Sobject,sxf
           LDA       0,i
           LDBYTEA   Sobject,sxf
           CPA       '\n',i
           BREQ      LL1
           LDA       ignored,s
           ADDA      1,i
           STA       ignored,s
           BR        ignore
LL1:       LDBYTEA   0,i
           STBYTEA   Sobject,sxf
           LDA       ignored,s
           BR        return
error:     LDA       -1,i
return:    RET4
;} STRInput.pep1 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;
;{ BINOutpt.pep1 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
;.GLOBAL  BINOutpt
m:         .EQUATE   4
BINOutpt:  NOP0
           SUBSP     0,i
           STA       SAVED,d
           LDA       0,i
           STA       -2,s
           SUBSP     2,i
           LDA       SAVED,d
           STA       SAVEA,d
           STX       SAVEX,d
           LDA       m,s
           LDX       16,i
BINOloop:  NOP0
           CPX       0,i
           BREQ      BINOdone
           ROLA
           BRC       BINO1
BINO0:     CHARO     '0',i
           BR        BINOnext
BINO1:     CHARO     '1',i
BINOnext:  NOP0
           SUBX      1,i
           BR        BINOloop
BINOdone:  NOP0
           LDX       SAVEX,d
           LDA       SAVEA,d
           ADDSP     0,s
           ADDSP     2,i
           RET0
;} BINOutpt.pep1 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;
;{ HEXOutpt.pep1 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
;.GLOBAL  HEXOutpt
Hm:        .EQUATE   4
HEXtext:   .block    4
           .word     0
HEXOutpt:  NOP0
           SUBSP     0,i
           STA       SAVED,d
           LDA       0,i
           STA       -2,s
           SUBSP     2,i
           LDA       SAVED,d
           STA       SAVEA,d
           STX       SAVEX,d
           LDA       Hm,s
           LDX       3,i
HEXOloop:  NOP0
           CPX       0,i
           BRLT      HEXOdone
           ANDA      0x000F,i
           CPA       10,i
           BRLT      HEX1
           ADDA      0x0007,i
HEX1:      ADDA      0x0030,i
           STBYTEA   HEXtext,x
           LDA       Hm,s
           RORA
           RORA
           RORA
           RORA
           STA       Hm,s
           SUBX      1,i
           BR        HEXOloop
HEXOdone:  STRO      HEXtext,d
           LDX       SAVEX,d
           LDA       SAVEA,d
           ADDSP     0,s
           ADDSP     2,i
           RET0
;} HEXOutpt.pep1 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;
;{ DUMPS.pep1 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
;.GLOBAL  DumpS
Acopy:     .BLOCK    2
Xcopy:     .BLOCK    2
display:   .BLOCK    2
actual:    .BLOCK    2
dmsg:      .ASCII    "------------------------------- DUMPS\n\x00"
cmsg:      .ASCII    ",\x00"
amsg:      .ASCII    "(A=\x00"
xmsg:      .ASCII    "(X=\x00"
dlmsg:     .ASCII    ": \x00"
DumpSN:    .EQUATE   2
DumpS:     NOP0
           STA       Acopy,d
           STX       Xcopy,d
           STRO      dmsg,d
           STA       actual,d
           STRO      amsg,d
           STA       SAVEPP,d
           LDA       actual,d
           STA       -2,s
           SUBSP     2,i
           LDA       SAVEPP,d
           CALL      HEXOutpt
           ADDSP     2,i
           STRO      cmsg,d
           DECO      actual,d
           CHARO     ')',i
           STRO      cmsg,d
           STX       actual,d
           STRO      xmsg,d
           STA       SAVEPP,d
           LDA       actual,d
           STA       -2,s
           SUBSP     2,i
           LDA       SAVEPP,d
           CALL      HEXOutpt
           ADDSP     2,i
           STRO      cmsg,d
           DECO      actual,d
           CHARO     ')',i
           CHARO     '\n',i
           LDX       DumpSN,s
           MOVSPA
           ADDA      4,i
           STA       actual,d
DumpLoop:  CPX       0,i
           BRLE      DumpDone
           STA       SAVEPP,d
           LDA       actual,d
           STA       -2,s
           SUBSP     2,i
           LDA       SAVEPP,d
           CALL      HEXOutpt
           ADDSP     2,i
           STRO      dlmsg,d
           LDA       actual,n
           STA       display,d
           STA       SAVEPP,d
           LDA       display,d
           STA       -2,s
           SUBSP     2,i
           LDA       SAVEPP,d
           CALL      HEXOutpt
           ADDSP     2,i
           STRO      cmsg,d
           DECO      display,d
           CHARO     '\n',i
           LDA       actual,d
           ADDA      2,i
           STA       actual,d
           SUBX      2,i
           BR        DumpLoop
DumpDone:  LDX       Xcopy,d
           LDA       Acopy,d
           RET0
;} DUMPS.pep1 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;
;{ SCompTo.pep2 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
;************************************************************************
; String subprogram that compares two strings (Sobjects) and
; returns a number less than zero if the first object is lexiographicall
; before (i.e. less than) the second, zero if they are equivalent, and a
; positive number otherwise.
;
;********  int ScompTo (char[] Sobject1, char[] Sobject2)
;
;-- Arguments -----------------------------------------------------------
Sobject1:  .EQUATE   2                                              ;formal parameter; address of Sobject
Sobject2:  .EQUATE   4                                              ;formal parameter; address of Sobject
;-- Local Data ----------------------------------------------------------
hold2:     .BLOCK    2
;-- Entry Point ---------------------------------------------------------
;.GLOBAL   ScompTo
;ScompTo:; SAVEX                                                    ;
ScompTo:   NOP0                                                     ;< SAVEX >
           STX       SAVEX,d                                        ;< SAVEX >
;<<<<<<<<< Instrumentation
           STRO      Sobject1,sf
           CHARO     '-',i
           STRO      Sobject2,sf
;>>>>>>>>>
;;;;;;;;;; CLRA                                                     ;  A = 0; ;
           LDA       0,i                                            ;< CLRA >
;loop:;;;; INCX                                                     ;
LL2:       NOP0                                                     ;< INCX >
           ADDX      1,i                                            ;< INCX >
           LDA       SObject2,sxf
           STA       hold2,d
           LDA       SObject1,sxf
           SUBA      hold2,d
           CPA       0,i
           BRNE      LL3
           CPA       x00,i
           BREQ      LL3
;done:;;;; RESTOREX                                                 ;
LL3:       NOP0                                                     ;< RESTOREX >
           LDX       SAVEX,d                                        ;< RESTOREX >
;<<<<<<<<< Instrumentation
           CHARO     ',',i
;;;;;;;;;; DECOA                                                    ;
           STA       TEMP,d                                         ;< DECOA >
           DECO      TEMP,d                                         ;< DECOA >
           CHARO     '\n',i
;>>>>>>>>>
           RET0                                                     ;
;} SCompTo.pep2 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
STOPEND:   STOP
           .END
;Resolver Report:
; loop --> LL0
; done --> LL1
; loop --> LL2
; done --> LL3
;-------------------------------------------------------------------
; Global "low memory" locations used for temporary static storage
          .GLOBAL    TEMP
TEMP:     .BLOCK     4
          .GLOBAL    JUNK
JUNK:  .BLOCK     2
          .GLOBAL    SAVED
SAVED:    .BLOCK     2
          .GLOBAL    SAVEA
SAVEA:    .BLOCK     2        ;where A is saved statically
          .GLOBAL    SAVEX
SAVEX:    .BLOCK     2        ;where X is saved statically
          .GLOBAL    SAVEPP
SAVEPP:   .BLOCK     2

;============================================================
          .MACRO     SAVEA
;------------------------------------------------------------CC Safe
; Macro to statically save the A register.
          STA        SAVEA,d
          .MACROEND

          .MACRO     SAVEX
;------------------------------------------------------------CC Safe
; Macro to statically save the X register.
          STX        SAVEX,d
          .MACROEND

          .MACRO     SAVE
;------------------------------------------------------------CC Safe
; Macro to statically save the A and X registers.
          SAVEA
          SAVEX
          .MACROEND

          .MACRO     RESTOREA
;------------------------------------------------------------CC Corruption
; Macro to statically restore the previously saved A register.
          LDA        SAVEA,d
          .MACROEND

          .MACRO     RESTOREX
;------------------------------------------------------------CC Corruption
; Macro to statically restore the previously saved X register.
          LDX        SAVEX,d
          .MACROEND

          .MACRO     RESTORE
;------------------------------------------------------------CC Corruption
; Macro to statically restore the previously saved A and X registers.
          RESTOREX
          RESTOREA
          .MACROEND

;============================================================
          .MACRO     BRNV     label',ml#
;------------------------------------------------------------CC Safe
; Macro to branch conditionally if NOT V;  oVerflow not set
          BRV        ml#
          BR         label'
ml#:      NOP0
          .MACROEND

          .MACRO     BRNC     label',ml#
;------------------------------------------------------------CC Safe
; Macro to branch conditionally if NOT C;  Carry not set
          BRC        ml#
          BR         label'
ml#:      NOP0

          .MACROEND

;============================================================
          .MACRO     CLRA
;------------------------------------------------------------CC Safe
; Macro to clear (load zero into) the A register.
          LDA        0,i
          .MACROEND

          .MACRO     CLRX
;------------------------------------------------------------CC Safe
; Macro to clear (load zero into) the X register.
          LDX        0,i
          .MACROEND

          .MACRO     CLR       arg',ams'
;------------------------------------------------------------CC Corruption
; Macro to clear (load zero into) the memory cell specified.
          STA        SAVEA,d
          CLRA
          STA        arg',ams'
          LDA        SAVEA,d
          .MACROEND

          .MACRO     INCA
;------------------------------------------------------------CC Safe
; Macro to "increment" the contents of the A register.
          ADDA       1,i
          .MACROEND

          .MACRO     INCX
;------------------------------------------------------------CC Safe
; Macro to "increment" the contents of the X register.
          ADDX       1,i
          .MACROEND

          .MACRO     INC        arg',ams'
;------------------------------------------------------------CC Corruption
; Macro to "increment" the contents of a word in memory addressed
; as specified.
          SAVEA      
          LDA        arg',ams'
          ADDA       1,i
          STA        arg',ams'
          RESTOREA
          .MACROEND

          .MACRO     DECA
;------------------------------------------------------------CC Safe
; Macro to "decrement" the contents of the A register.
          SUBA       1,i
          .MACROEND

          .MACRO     DECX
;------------------------------------------------------------CC Safe
; Macro to "decrement" the contents of the X register.
          SUBX       1,i
          .MACROEND

          .MACRO     DEC        arg',ams'
;------------------------------------------------------------CC Corruption
; Macro to "decrement" the contents of a word in memory addressed
; as specified.
          SAVEA
          LDA        arg',ams'
          SUBA       1,i
          STA        arg',ams'
          RESTOREA
          .MACROEND

          .MACRO     NOT       arg',ams'
;------------------------------------------------------------CC Corruption
; Macro to complement the bits in a word addressed as specified.
          SAVEA
          LDA        arg',ams'
          NOTA
          STA        arg',ams'
          RESTOREA
          .MACROEND

          .MACRO     NEG       arg',ams'
;------------------------------------------------------------CC Corruption
; Macro to negate the contents of a word addressed as specified.
          SAVEA
          LDA        arg',ams'
          NEGA
          STA        arg',ams'
          RESTOREA
          .MACROEND

          .MACRO     ADD        Sum',ams1',Addend',ams2'
;------------------------------------------------------------CC Corruption
; Macro to accomplish the addition of an two operands storing the
; result in the first operand.
          SAVEA
          LDA        Sum',ams1'
          ADDA       Addend',ams2'
          STA        Sum',ams1'
          RESTOREA
          .MACROEND

          .MACRO     SUB        Minuend',ams1',Subtrnd',ams2'
;------------------------------------------------------------CC Corruption
; Macro to accomplish the subtraction of a second operand from a the
; first operand, storing the result in the first operand.
          SAVEA
          LDA        Minuend',ams1'
          SUBA       Subtrnd',ams2'
          STA        Minuend',ams1'
          RESTOREA
          .MACROEND

          .MACRO     MOVE      arg1',ams1',arg2',ams2'
;------------------------------------------------------------CC Corruption
; Macro that moves the contents of one memory cell to another cell.
          SAVEA
          LDA        arg1',ams1'
          STA        arg2',ams2'
          RESTOREA
          .MACROEND

          .MACRO     TSTA
;------------------------------------------------------------CC Safe
; Macro to "test" the accumulator;  that is, it sets the condition
; codes after comparing the accumulator to zero.
          CPA        0,i
          .MACROEND

          .MACRO     TSTX
;------------------------------------------------------------CC Safe
; Macro to "test" the index register;  that is, it sets the condition
; codes after comparing the index register to zero.
          CPX        0,i
          .MACROEND

          .MACRO     TEST        arg',ams'
;-------------------------------------------------CC Safe, Corrupts A
; Macro to "test" the contents of a memory location;  that is, it
; sets the condition codes after comparing to zero.  The A register
; is polluted and will contain the value of the argument.
          LDA        arg',ams'
          TSTA
          .MACROEND

          .MACRO     CPM        arg1',ams1',arg2',ams2'
;-------------------------------------------------CC Safe, Corrupts A
; Macro to compare two items in memory.  It sets the condition
; codes by comparing arg1 to arg2.  Pollutes the A register such
; that A will contain the value of the first argument.
          LDA        arg1',ams1'
          CPA        arg2',ams2'
          .MACROEND

          .MACRO     PUSHA
;------------------------------------------------------------CC Corruption
; Macro to "push" the contents of the accumulator onto the stack.
          STA        -2,s
          SUBSP      2,i
          .MACROEND

          .MACRO     PUSHX
;------------------------------------------------------------CC Corruption
; Macro to "push" the contents of the index register onto the stack.
          STX        -2,s
          SUBSP      2,i
          .MACROEND

          .MACRO     POPA
;------------------------------------------------------------CC Corruption
; Macro to "pop" the contents of the accumulator off of the stack.
          LDA        0,s
          ADDSP      2,i
          .MACROEND

          .MACRO     POPX
;------------------------------------------------------------CC Corruption
; Macro to "pop" the contents of the index register off of the stack.
          LDX        0,s
          ADDSP      2,i
          .MACROEND

          .MACRO     PUSH       arg',ams'
;------------------------------------------------------------CC Corruption
; Macro to "push" the contents of a word in memory addressed as
; specified.
          STA        SAVEPP,d
          LDA        arg',ams'
          PUSHA
          LDA        SAVEPP,d
          .MACROEND

          .MACRO     POP        arg',ams'
;------------------------------------------------------------CC Corruption
; Macro to "pop" the contents of a word to memory addressed as
; specified.
          STA        SAVEPP,d
          POPA
          STA        arg',ams'
          LDA        SAVEPP,d
          .MACROEND

          .APPEND    "STRInput.pep1"
          .MACRO     STRI     arg',ams'
;------------------------------------------------------------CC Corruption
; Macro to input a line of input as a "string object".  Note that A
; is corrupted such that it contains the count of the number of 
; characters read but truncated from the object's result due to
; unavailable capacity.  Thus, a zero value returned in A indicates
; that the entire input has been stored in the string.
          PUSH       arg',ams'
          CALL       STRInput
          ADDSP      2,i
          .MACROEND

          .MACRO     DECIA
;------------------------------------------------------------CC Corruption
; Macro to read a decimal value as input and load it into A.
          DECI       TEMP,d
          LDA        TEMP,d
          .MACROEND

          .MACRO     DECIX
;------------------------------------------------------------CC Corruption
; Macro to read a decimal value as input and load it into X.
          DECI       TEMP,d
          LDX        TEMP,d
          .MACROEND

          .MACRO     DECOA
;------------------------------------------------------------CC Safe
; Macro to write the decimal value currently in A.
          STA        TEMP,d
          DECO       TEMP,d
          .MACROEND

          .MACRO     DECOX
;------------------------------------------------------------CC Safe
; Macro to write the decimal value currently in X.
          STX        TEMP,d
          DECO       TEMP,d
          .MACROEND

          .MACRO     BINOA
;------------------------------------------------------------CC Corruption
; Macro to output the value in A in binary
          PUSHX
          STA        TEMP,d
          BINO       TEMP,d
          POPX
          LDA        TEMP,d
          .MACROEND

          .MACRO     BINOX
;------------------------------------------------------------CC Corruption
; Macro to output the value in X in binary
          PUSHA
          STX        TEMP,d
          BINO       TEMP,d
          POPA
          LDX        TEMP,d
          .MACROEND

          .APPEND    "BINOutpt.pep1"
          .MACRO     BINO     arg',ams'
;------------------------------------------------------------CC Corruption
; Macro to output the contents of a memory cell in binary
          PUSH       arg',ams'
          CALL       BINOutpt
          ADDSP      2,i
          .MACROEND

          .MACRO     HEXOA
;------------------------------------------------------------CC Corruption
; Macro to output the value in A in hex
          PUSHX
          STA        TEMP,d
          HEXO       TEMP,d
          POPX
          LDA        TEMP,d
          .MACROEND

          .MACRO     HEXOX
;------------------------------------------------------------CC Corruption
; Macro to output the value in X in hex
          PUSHA
          STX        TEMP,d
          HEXO       TEMP,d
          POPA
          LDX        TEMP,d
          .MACROEND

          .APPEND    "HEXOutpt.pep1"
          .MACRO     HEXO     arg',ams'
;------------------------------------------------------------CC Corruption
; Macro to output the contents of a memory cell in hex
          PUSH       arg',ams'
          CALL       HEXOutpt
          ADDSP      2,i
          .MACROEND

          .APPEND    "DUMPS.pep1"
;-------------------------------------------------------------CC Corruption
; Macro to dump the top portion of the stack
          .MACRO     DUMPS    arg',ams'
          STA        JUNK,d
          LDA        arg',ams'
          PUSHA
          LDA        JUNK,d
          CALL       DumpS
          STA        JUNK,d
          POPA
          LDA        JUNK,d
          .MACROEND

;============================================================
          .MACRO     LDBYTEAC   arg',ams'
;------------------------------------------------------------CC Safe
; Macro to clear the high-order byte along with loading the low-order byte of A
          CLRA
          LDBYTEA    arg',ams'
          .MACROEND

          .MACRO     LDBYTEXC   arg',ams'
;------------------------------------------------------------CC Safe
; Macro to clear the high-order byte along with loading the low-order byte of X
          CLRX
          LDBYTEX    arg',ams'
          .MACROEND



%PDF-1.5
%����
1 0 obj
<</Type/Catalog/Pages 2 0 R/Lang(en-US) /StructTreeRoot 33 0 R/MarkInfo<</Marked true>>>>
endobj
2 0 obj
<</Type/Pages/Count 2/Kids[ 3 0 R 18 0 R] >>
endobj
3 0 obj
<</Type/Page/Parent 2 0 R/Resources<</Font<</F1 5 0 R/F2 7 0 R/F3 12 0 R/F4 14 0 R/F5 16 0 R>>/ProcSet[/PDF/Text/ImageB/ImageC/ImageI] >>/MediaBox[ 0 0 612 792] /Contents 4 0 R/Group<</Type/Group/S/Transparency/CS/DeviceRGB>>/Tabs/S/StructParents 0>>
endobj
4 0 obj
<</Filter/FlateDecode/Length 22505>>
stream
x���k��6����wx^ڋ��n�;�9�H����2g_�8m��N�����O$U%^�_�����U>EJ��H�_~��x������O�����7���|�����?�Ǘ����������]?�����ϗg_?�<{��g_�k}/��~�Y}���՗���p�]^���g����|��ߟ<���u�䇧_�O^=��ri�NO�ӺzR-��<�������of�争\�Uո�������5���*��U�%b�hKP]?,5|x���߽{�Q�׊׊������:��p5�հn��������/�'���Z����+��.,��Z��~�����x��'U��]����@� ՕVv�=U�N������*)�M�Uz]��͇����UW��z1���m�h���+W�+\5^Maѿ.U�������?�n���ݓ7���t���˫�����|���j�aZ~@]%O���������_�T�O���E�����ֻ[�U�(kǫ�[�mxuY�c�����]?�~Z7s����>�bzr����6G�Zc������?%TS{5�����uU�����]uU�߹��wO�'7����ڨJڣ���Ҹj��6�|��Һ�=��ח�[��@echo off
copy %1 tempP.pep
java PrettyPrinter tempP.pep > %1
cp $1 tempP.pep
java PrettyPrinter tempP.pep > $1


����   4:
 ` � ����
 � �
 � �
 � �
 _ � �
  �
  �	 _ �
  �
 � �
 � �
 _ �
 _ �
 _ �
 _ �	 _ �	 _ �	 _ �	 _ � �
  �
  �
 _ � �	 _ �
 _ �
 _ �
 _ �
 _ �	 _ �
 _ �	 _ �
 _ �
 � �
 � �
 _ �
 _ �
 _ �
 _ �
 _ �
 _ �
 _ �
 _ �
 _ �
 _ �
 _ �
 _ �
 _ �	 _ �	 _ �
 � �
 � � �
 � �
 _ � �	 _ �
 _ �
 _ �
 _ �
 _ �
 _ �
 _ �
 _ �
 _ 	 _
 
 �
 _
 _
 _	 _
 _
 _	
 _

 _
 _	

 _
 _
 
 V   import java.util.Scanner;    import java.io.File;    public class PrettyPrinter {       final static String _debug_symbol01010111 =  PCEncrypt._debug_symbol_d_debug( "_debug_;");       final static String _debug_symbol_xlOlOllllllllABEL0111 =  PCEncrypt._debug_symbol_d_debug( "_debug_:");       final static String _debug_symbol_ONE_SPACE =  PCEncrypt._debug_symbol_d_debug( "_debug_ ");       final static String _debug_symbol_END_OF_xlOlOllllllllINE_ID =  PCEncrypt._debug_symbol_d_debug( "_debug_^");       final static String _debug_symbol0l11_EXPANSION0ll1 =  PCEncrypt._debug_symbol_d_debug( "_debug_%");       final static String _debug_symbol0111S =  PCEncrypt._debug_symbol_d_debug( "_debug_ \t") + _debug_symbol01010111;       private static String _debug_symbol_OklInputLine;       private static String _debug_symbol__Olo_PrinterOlOlO_l;       private static int _debug_symbol_labelllll0 = 0;       private static int _debug_symbol_operatorllll0 = 0;       private static int _debug_symbol_operandslength = 0;       private static int _debug_symbol_commentllll0 = 0;       private static int _debug_symbol_linellll0 = 0;       static int _debug_symbol_spacing = 2;       public static int _debug_symbol_maxOf(int _debug_symbol_int1, int _debug_symbol_int2) {          return (_debug_symbol_int1 > _debug_symbol_int2) ? _debug_symbol_int1 : _debug_symbol_int2;       }       public static int _debug_symbol_minOf(int _debug_symbol_int1, int _debug_symbol_int2) {          return (_debug_symbol_int1 < _debug_symbol_int2) ? _debug_symbol_int1 : _debug_symbol_int2;       }       public static int _debug_symbol_indexOfDlOlOlllllllls(String source, String _debug_symbol_l) {          int result = Integer.MAX_VALUE;          int location;          for (int _debug_symbol_i = 0; _debug_symbol_i < _debug_symbol_l.length(); _debug_symbol_i++) {             location = source.indexOf(_debug_symbol_l.charAt(_debug_symbol_i));             result = _debug_symbol_minOf(location, result);          }          if (result == Integer.MAX_VALUE) {             result = -1;          }          return result;       }       public static String _debug_symbol_l0l(String _debug_symbol_string, int width) {          while (_debug_symbol_string.length() < width) {             _debug_symbol_string = _debug_symbol_string + _debug_symbol_ONE_SPACE;          }          return _debug_symbol_string;       }       public static String _debug_symbol_l0l0lTrim(String _debug_symbol_string) {          while ((_debug_symbol_string.length() > 0) && (_debug_symbol_string.lastIndexOf(_debug_symbol_ONE_SPACE) == (_debug_symbol_string.length() - 1))) {             _debug_symbol_string = _debug_symbol_string.substring(0, (_debug_symbol_string.length() - 1));          }          return _debug_symbol_string;       }       public static void main(String[] _debug_symbol_args) throws Exception {          File _debug_symbol_fileInputFromArgs = _debug_symbol_readArgs(_debug_symbol_args);          _debug_symbol_OlOll1lOlkInputLine(_debug_symbol_fileInputFromArgs);          _debug_symbol_adjustllll0s();          _debug_symbol_iterateOverInputToBuildOlOlO_l(_debug_symbol_fileInputFromArgs);       }       private static void _debug_symbol_adjustllll0s() {          _debug_symbol_labelllll0 = _debug_symbol_labelllll0 + 1 + _debug_symbol_spacing;          _debug_symbol_operatorllll0 = _debug_symbol_operatorllll0 + _debug_symbol_spacing;          _debug_symbol_operandslength = _debug_symbol_operandslength + _debug_symbol_spacing;       }       private static void _debug_symbol_iterateOverInputToBuildOlOlO_l(File _debug_symbol_fileInputFromArgs) throws Exception {          Scanner input = new Scanner(_debug_symbol_fileInputFromArgs);          while (input.hasNext()) {             _debug_symbol_OlOll1lAndPrintOlOlO_l(input);          }       }       private static void _debug_symbol_OlOll1lAndPrintOlOlO_l(Scanner input) {          _debug_symbol__Olo_PrinterOlOlO_l = "";          _debug_symbol_cleanNextLine(input);          String comment = _debug_symbol_OoOol1lComment();          _debug_symbol_OlOll1lOlOlO_lIfValidLinellll0();          _debug_symbol_printOlOlO_l(comment);       }       private static void _debug_symbol_OlOll1lOlOlO_lIfValidLinellll0() {          if (_debug_symbol_OklInputLine.length() > 1) {             _debug_symbol_OlOll1lOlOlO_l();          }       }       private static String _debug_symbol_OoOol1lComment() {          String comment = "";          int location = indexOf(_debug_symbol_OklInputLine,_debug_symbol01010111);          while (location >= 0) {             comment = _debug_symbol_OklInputLine.substring(location).trim();             boolean _debug_symbol_macroExpanded = _debug_symbol_isMacroExpanded(location);             location = _debug_symbol_OlOl1llMacroExpanded(location, _debug_symbol_macroExpanded);          }          return comment;       }       private static void _debug_symbol_OlOll1lOlOlO_l() {          String _debug_symbol_field = "";          _debug_symbol_field = _debug_symbol_OlOl1llLabelDlOlOllllllll();          _debug_symbol_OlOl1llMacroExpansionO1OOOOOOOO(_debug_symbol_field);          _debug_symbol_l0lOlOlO_lToMatchLabelllll0();          _debug_symbol_field = _debug_symbol_OlOl1llOOOOOOOOOSpace();          _debug_symbol_l0lOlOlO_lToMatchOperatorllll0(_debug_symbol_field);          _debug_symbol_field = _debug_symbol_OlOl1llEndOfLineId();          _debug_symbol_l0lOlOlO_lToMatchOperandsllll0(_debug_symbol_field);       }       private static void _debug_symbol_l0lOlOlO_lToMatchOperandsllll0(String _debug_symbol_field) {          _debug_symbol__Olo_PrinterOlOlO_l = _debug_symbol__Olo_PrinterOlOlO_l + _debug_symbol_l0l(_debug_symbol_field, _debug_symbol_operandslength);       }       private static String _debug_symbol_OlOl1llEndOfLineId() {          int location;          String _debug_symbol_field;          location = _debug_symbol_OoOol1lEndOfLineIdLocation();          if (location > 0) {             _debug_symbol_field = _debug_symbol_OklInputLine.substring(0, location);             _debug_symbol_OklInputLine = _debug_symbol_removeSingleCharIdFromOlkInputLine(location) + _debug_symbol_ONE_SPACE;          }          else {             _debug_symbol_field = "";          }          return _debug_symbol_field;       }       private static void _debug_symbol_l0lOlOlO_lToMatchOperatorllll0(String _debug_symbol_field) {          _debug_symbol__Olo_PrinterOlOlO_l = _debug_symbol__Olo_PrinterOlOlO_l + _debug_symbol_l0l(_debug_symbol_field, _debug_symbol_operatorllll0);       }       private static String _debug_symbol_OlOl1llOOOOOOOOOSpace() {          int location;          String _debug_symbol_field;          location = _debug_symbol_OoOol1lOOOOOOOOOSpaceLocation();          if (location > 0) {             _debug_symbol_field = _debug_symbol_OklInputLine.substring(0, location);             _debug_symbol_OklInputLine = _debug_symbol_removeSingleCharIdFromOlkInputLine(location) + _debug_symbol_END_OF_xlOlOllllllllINE_ID;          }          else {             _debug_symbol_field = "";          }          return _debug_symbol_field;       }       private static void _debug_symbol_l0lOlOlO_lToMatchLabelllll0() {          while (_debug_symbol__Olo_PrinterOlOlO_l.length() < _debug_symbol_labelllll0) {             _debug_symbol__Olo_PrinterOlOlO_l = _debug_symbol__Olo_PrinterOlOlO_l + _debug_symbol_ONE_SPACE;          }       }       private static void _debug_symbol_OlOl1llMacroExpansionO1OOOOOOOO(String _debug_symbol_field) {          if (_debug_symbol__Olo_PrinterOlOlO_l.indexOf(_debug_symbol0l11_EXPANSION0ll1) == 0) {             _debug_symbol__Olo_PrinterOlOlO_l = _debug_symbol01010111 + _debug_symbol_field;             while (_debug_symbol__Olo_PrinterOlOlO_l.length() < (_debug_symbol_labelllll0 - _debug_symbol01010111.length())) {                _debug_symbol__Olo_PrinterOlOlO_l = _debug_symbol__Olo_PrinterOlOlO_l + _debug_symbol01010111;             }          }          else {             _debug_symbol__Olo_PrinterOlOlO_l = _debug_symbol__Olo_PrinterOlOlO_l + _debug_symbol_l0l(_debug_symbol_field, _debug_symbol_labelllll0);          }       }       private static boolean _Ollk_(String S, int index, String _debug_symbol_DlOlOllllllll) {          boolean result = false;          int length = _debug_symbol_DlOlOllllllll.length();          int _debug_symbol_prev = 0 - length;          int _debug_symbol_curr;          boolean _debug_symbol_literal = false;          do {             _debug_symbol_curr = S.indexOf(_debug_symbol_DlOlOllllllll,(_debug_symbol_prev+length));             if((_debug_symbol_curr >= 0) && (_debug_symbol_curr < index)) {                _debug_symbol_prev = _debug_symbol_curr;                _debug_symbol_literal = !_debug_symbol_literal;             }          } while((_debug_symbol_curr >= 0) && (_debug_symbol_curr < index));          result = _debug_symbol_literal && (S.indexOf(_debug_symbol_DlOlOllllllll,(_debug_symbol_prev+length)) > index);          return result;       }       private static int indexOf(String S, String _debug_symbol_DlOlOllllllll) {          int result = S.indexOf(_debug_symbol_DlOlOllllllll);          while((result >= 0) && (_Ollk_(S,result, PCEncrypt._debug_symbol_d_debug( "_debug_'")) || _Ollk_(S,result, PCEncrypt._debug_symbol_d_debug( "_debug_\"")))) {             result = S.indexOf(_debug_symbol_DlOlOllllllll,(result+_debug_symbol_DlOlOllllllll.length()));          }          return result;       }       private static String _debug_symbol_OlOl1llLabelDlOlOllllllll() {          int location;          String _debug_symbol_field;          location = indexOf(_debug_symbol_OklInputLine,_debug_symbol_xlOlOllllllllABEL0111);          if (location >= 0) {             _debug_symbol_field = _debug_symbol_OklInputLine.substring(0, (location + _debug_symbol_xlOlOllllllllABEL0111.length()));             _debug_symbol_OklInputLine = (_debug_symbol_removeLabelDlOlOllllllllFromOlkInputLine(location)).trim() + _debug_symbol_ONE_SPACE;          }          else {             _debug_symbol_field = "";          }          return _debug_symbol_field;       }       private static int _debug_symbol_OlOl1llMacroExpanded(int location, boolean _debug_symbol_macroExpanded) {          if (_debug_symbol_macroExpanded) {             _debug_symbol__Olo_PrinterOlOlO_l = _debug_symbol0l11_EXPANSION0ll1;             _debug_symbol_OklInputLine = _debug_symbol_OklInputLine.substring(2).trim();             location = indexOf(_debug_symbol_OklInputLine,_debug_symbol01010111);          }          else {             _debug_symbol_OklInputLine = (_debug_symbol_OklInputLine.substring(0, location)).trim() + _debug_symbol_ONE_SPACE;             location = -1;          }          return location;       }       private static boolean _debug_symbol_isMacroExpanded(int location) {          return (location == 0) && (_debug_symbol_OklInputLine.charAt(1) == ';');       }       private static void _debug_symbol_OlOll1lOlkInputLine(File _debug_symbol_fileInputFromArgs) throws Exception {          Scanner input = new Scanner(_debug_symbol_fileInputFromArgs);          while (input.hasNext()) {             _debug_symbol_cleanNextLine(input);             _debug_symbol_calcLinellll0();             _debug_symbol_evalIdLocations();          }       }       private static void _debug_symbol_evalIdLocations() {          int location = _debug_symbol_OoOol1lLabelDlOlOllllllllLocation();          _debug_symbol_evalLabelDlOlOllllllllLocation(location);          location = _debug_symbol_OoOol1lOOOOOOOOOSpaceLocation();          _debug_symbol_evalOOOOOOOOOSpaceLocation(location);          location = _debug_symbol_OoOol1lEndOfLineIdLocation();          _debug_symbol_evalEndOfLineIdLocation(location);       }       private static void _debug_symbol_evalLabelDlOlOllllllllLocation(int location) {          if (location >= 0) {             _debug_symbol_labelllll0 = _debug_symbol_maxOf(location, _debug_symbol_labelllll0);             _debug_symbol_OklInputLine = _debug_symbol_removeLabelDlOlOllllllllFromOlkInputLine(location) + _debug_symbol_ONE_SPACE;          }       }       private static String _debug_symbol_removeLabelDlOlOllllllllFromOlkInputLine(int location) {          return _debug_symbol_OklInputLine.substring(location + _debug_symbol_xlOlOllllllllABEL0111.length()).trim();       }       private static void _debug_symbol_evalEndOfLineIdLocation(int location) {          if (location > 0) {             _debug_symbol_operandslength = _debug_symbol_maxOf(location, _debug_symbol_operandslength);             _debug_symbol_OklInputLine = _debug_symbol_removeSingleCharIdFromOlkInputLine(location) + _debug_symbol_ONE_SPACE;          }       }       private static String _debug_symbol_removeSingleCharIdFromOlkInputLine(int location) {          return (_debug_symbol_OklInputLine.substring(location + 1)).trim();       }       private static int _debug_symbol_OoOol1lEndOfLineIdLocation() {          return _debug_symbol_OklInputLine.indexOf(_debug_symbol_END_OF_xlOlOllllllllINE_ID);       }       private static void _debug_symbol_evalOOOOOOOOOSpaceLocation(int location) {          if (location > 0) {             _debug_symbol_operatorllll0 = _debug_symbol_maxOf(location, _debug_symbol_operatorllll0);             _debug_symbol_OklInputLine = _debug_symbol_removeSingleCharIdFromOlkInputLine(location) + _debug_symbol_END_OF_xlOlOllllllllINE_ID;          }       }       private static int _debug_symbol_OoOol1lOOOOOOOOOSpaceLocation() {          return _debug_symbol_OklInputLine.indexOf(_debug_symbol_ONE_SPACE);       }       private static void _debug_symbol_calcLinellll0() {          _debug_symbol_linellll0 = _debug_symbol_maxOf(_debug_symbol_OklInputLine.length(), _debug_symbol_linellll0);       }       private static void _debug_symbol_cleanNextLine(Scanner input) {          _debug_symbol_OklInputLine = input.nextLine();          _debug_symbol_OklInputLine = _debug_symbol_OklInputLine.replace('\t', ' ');          _debug_symbol_OklInputLine = _debug_symbol_trimAndAppendOOOOOOOOOSpace(_debug_symbol_OklInputLine);       }       private static String _debug_symbol_trimAndAppendOOOOOOOOOSpace(String _debug_symbol_string) {          return _debug_symbol_string.trim() + _debug_symbol_ONE_SPACE;       }       private static int _debug_symbol_OoOol1lLabelDlOlOllllllllLocation() {          int location = indexOf(_debug_symbol_OklInputLine,_debug_symbol01010111);          while (location >= 0) {             location = _debug_symbol_modifyCommentLineAndLocation(location);          }          location = indexOf(_debug_symbol_OklInputLine,_debug_symbol_xlOlOllllllllABEL0111);          return location;       }       private static int _debug_symbol_modifyCommentLineAndLocation(int location) {          _debug_symbol_commentllll0 = _debug_symbol_calcCommentllll0(location);          location = _debug_symbol_splitOlkInputLineAndFindCommentDlOlOllllllll(location);          return location;       }       private static int _debug_symbol_calcCommentllll0(int location) {          return _debug_symbol_maxOf((_debug_symbol_OklInputLine.length() - location), _debug_symbol_commentllll0);       }       private static int _debug_symbol_splitOlkInputLineAndFindCommentDlOlOllllllll(int location) {          String newLine = _debug_symbol_OklInputLine.substring(location + 1) + _debug_symbol_ONE_SPACE;          location = _debug_symbol_OoOol1lCommentDlOlOllllllll(location, newLine);          return location;       }       private static int _debug_symbol_OoOol1lCommentDlOlOllllllll(int location, String newLine) {          int _debug_symbol_loc = indexOf(newLine,_debug_symbol01010111);          if(_debug_symbol_loc == 0) {             _debug_symbol_OklInputLine = newLine.substring(2);             location = indexOf(_debug_symbol_OklInputLine,_debug_symbol01010111);          }          else {             _debug_symbol_OklInputLine = _debug_symbol_OklInputLine.substring(0, location) + _debug_symbol_ONE_SPACE;             location = -1;          }          return location;       }       private static void _debug_symbol_printOlOlO_l(String comment) {          _debug_symbol__Olo_PrinterOlOlO_l = _debug_symbol__Olo_PrinterOlOlO_l + _debug_symbol_l0l(comment, _debug_symbol_calcOlOlO_lWidth());          String _debug_symbol_trimmedOlOlO_l = _debug_symbol_l0l0lTrim(_debug_symbol__Olo_PrinterOlOlO_l);          printString(_debug_symbol_trimmedOlOlO_l);       }       private static void printString(String _debug_symbol_string) {          System.out.println(_debug_symbol_string);       }       private static int _debug_symbol_calcOlOlO_lWidth() {          return (_debug_symbol_linellll0 - (_debug_symbol_labelllll0 + _debug_symbol_operatorllll0 + _debug_symbol_operandslength + _debug_symbol_commentllll0));       }       private static File _debug_symbol_readArgs(String[] _debug_symbol_args) {          File _debug_symbol_fileInputFromArgs = _debug_symbol_getFileInputFromArgs(_debug_symbol_args);          _debug_symbol_setSpacing(_debug_symbol_args);          return _debug_symbol_fileInputFromArgs;       }       private static void _debug_symbol_setSpacing(String[] _debug_symbol_args) {          if (_debug_symbol_args.length > 1) {             _debug_symbol_spacing = Integer.parseInt(_debug_symbol_args[1]);          }       }       private static File _debug_symbol_getFileInputFromArgs(String[] _debug_symbol_args) {          return new File(_debug_symbol_args[0]);       }    }  
;---------------------------------------------------------------
;  int prntStgs(address p[], int n)
;---------------------------------------------------------------
p:         .EQUATE  2  
n:         .EQUATE  4
;--------
index:     .BLOCK    2
ptemp:     .BLOCK    2
;---------------------------------------------------------------
           .GLOBAL   prntStgs
prntStgs:  NOP0
;---------
; S t u b b e d
;--------
done:      RET0
;---------------------------------------------------------------
;  int readStgs(address p[], byte a[], int length, int limit)
;---------------------------------------------------------------
p:         .EQUATE  2  
a:         .EQUATE  4
length:    .EQUATE  6
limit:     .EQUATE  8
;--------
           .BYTE     31
value:     .BLOCK    31
index:     .BLOCK    2
disp:      .BLOCK    2
;---------------------------------------------------------------
msgtrunc:  .ASCII   "WARNING: input truncation \x00"
msgfull:   .ASCII   "WARNING: string array full\n\x00"
;---------------------------------------------------------------
           .GLOBAL   readStgs
readStgs:  NOP0
           CLR       index,d
loop:      CPM       index,d,limit,s
           BRGE      full
           STRI      value,i
           TSTA
           BREQ      move
           STRO      msgtrunc,d
           DECOA
           CHARO     '\n',i
move:      PUSH      value,i
           CALL      Slength
           ADDSP     2,i
           TSTA
           BREQ      done
;---------
           LDA       length,s
           INCA
           STA       -2,s
           LDX       index,d
           ASLX
           ASLX
           ASLX
           ASLX
           ASLX
           STX       disp,d
           ADD       disp,d,a,s
           MOVE      disp,d,-4,s
           LDA       value,i
           DECA
           STA       -6,s      
           SUBSP     6,i
           CALL      memcpy
           ADDSP     6,i
;---------
           INC       disp,d
           LDX       index,d
           ASLX
           MOVE      disp,d,p,sxf
;---------
           INC       index,d
           BR loop
;--------
full:      STRO      msgfull,d
;--------
done:      LDA       index,d
           RET0
����   4 �
 : \ ] ^
  _
  `
 9 a
 9 b	 c d
 e f g
  h i
  \
  j
  k	 9 l
  m
 n o
 n p
 n q	 9 r s
 t u v w
  \	 9 x
 n y
 n z
 9 {
  |
  } ~	 9 
 9 �
 n � � � �	 9 �
  � �
 * �
 * � � �
 9 �	 9 �	 9 �
 n � � � � � � � � � _debug_symbol_000l Ljava/lang/String; _debug_symbol_0000 l_0000 l_0101 _debug_symbol_lllllll_ _debug_symbol_0l0l _debug_symbol_llllllll_ Ljava/lang/Integer; <init> ()V Code LineNumberTable main ([Ljava/lang/String;)V 
Exceptions � _debug_symbol_looooloool '(Ljava/util/Scanner;)Ljava/lang/String; StackMapTable � _debug_symbol_000_00l 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; _l0l0l0l0l0l0l0l0l0l0ll0 &(Ljava/lang/String;)Ljava/lang/String; w indexOf ((Ljava/lang/String;Ljava/lang/String;I)I 
replaceAll J(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; <clinit> 
SourceFile Resolver.java D E java/util/Scanner java/io/File D � D � L M R S � � � � � �   � � java/lang/StringBuilder � � � � ; < � � � U � � � � � > < _debug_Resolver Report: � � S 	_debug_LL java/util/ArrayList A < U � � � P Q � � � � (_debug_---WARNING: multiple .GLOBAL for  ? < U V � � +_debug_ ERROR ===> duplicate global label,  _debug_{ _debug_} B C � � java/lang/Integer � � D � _debug_  _debug_ -->  W X = < @ < � � H_debug_ ERROR ===> unable to _l0l0l0l0l0l0l0l0l0l0ll0 dupplicate label,  _debug_
 _debug_; _debug_: _debug_, _debug_.GLOBAL Resolver java/lang/Object java/io/IOException java/lang/String (Ljava/lang/String;)V (Ljava/io/File;)V java/lang/System out Ljava/io/PrintStream; java/io/PrintStream println hasNext ()Z append -(Ljava/lang/String;)Ljava/lang/StringBuilder; nextLine ()Ljava/lang/String; toString (Ljava/lang/String;)I length ()I 	substring (II)Ljava/lang/String; 	PCEncrypt _debug_symbol_d_debug (Ljava/lang/String;I)I trim contains (Ljava/lang/Object;)Z add lastIndexOf -(Ljava/lang/Object;)Ljava/lang/StringBuilder; intValue (I)V (I)Ljava/lang/String; ! 9 :     ; <    = <    > <    ? <    @ <    A <    B C     D E  F        *� �    G        	 H I  F   <     $� Y� Y*2� � L+� M,� M� ,� 	�    G        J     K  L M  F   R     +
L*� � "� Y� +� *� � � � � L���+�    G        N   	 �  O%  P Q  F   :     *+� =� *� =*� �    G        N    �   R S  F      �� Y� � � � � � � � L� M� Y�  import java.util.*; import java.io.*; public class Resolver { static final String _debug_symbol_000l = PCEncrypt._debug_symbol_d_debug( "_debug_\n"); static final String _debug_symbol_0000 = PCEncrypt._debug_symbol_d_debug( "_debug_ "); static final String l_0000 = PCEncrypt._debug_symbol_d_debug( "_debug_;"); static final String l_0101 = PCEncrypt._debug_symbol_d_debug( "_debug_:"); static final String _debug_symbol_lllllll_ = PCEncrypt._debug_symbol_d_debug( "_debug_,"); static final String _debug_symbol_0l0l = PCEncrypt._debug_symbol_d_debug( "_debug_.GLOBAL"); static Integer _debug_symbol_llllllll_ = new Integer(0); public static void main (String[] _debug_symbol_args) throws IOException { Scanner _00000l = new Scanner(new File(_debug_symbol_args[0])); String S = _debug_symbol_looooloool(_00000l); S = _l0l0l0l0l0l0l0l0l0l0ll0(S); System.out.println(S); } static String _debug_symbol_looooloool(Scanner _00000l) { String looooloool = ""; while(_00000l.hasNext()) { looooloool = looooloool + _00000l.nextLine() + _debug_symbol_000l; } return looooloool; } static String _debug_symbol_000_00l(String S, String Comment) { int index = S.indexOf(Comment); if(index < 0) index = S.length(); return S.substring(0,index); } static String _l0l0l0l0l0l0l0l0l0l0ll0(String S) { String report = l_0000 + PCEncrypt._debug_symbol_d_debug( "_debug_Resolver Report:") + _debug_symbol_000l; String _debug_symbol_ll = PCEncrypt._debug_symbol_d_debug( "_debug_LL"); ArrayList<String> global = new ArrayList<String>(); ArrayList<String> _debug_symbol_locals = new ArrayList<String>(); int index; int grop, gris; index = 0; while(index < S.length()) { index = S.indexOf(_debug_symbol_0l0l,index); if(index < 0) { index = S.length(); } else { grop = index+_debug_symbol_0l0l.length(); gris = S.indexOf(_debug_symbol_000l,grop); String label = S.substring(grop,gris).trim(); label = _debug_symbol_000_00l(label,l_0000); if(!global.contains(label)) { global.add(label); } else { System.out.println(l_0000+ PCEncrypt._debug_symbol_d_debug( "_debug_---WARNING: multiple .GLOBAL for ") + label); } index = gris + _debug_symbol_000l.length(); } } index = 0; while(index < S.length()) { index = indexOf(S,l_0101,index); if(index < 0) { index = S.length(); } else { grop = S.lastIndexOf(_debug_symbol_000l,index) + _debug_symbol_000l.length(); String label = S.substring(grop,index).trim(); if(!_debug_symbol_locals.contains(label)) { _debug_symbol_locals.add(label); } else { if(global.contains(label)) { System.out.println(l_0000+ PCEncrypt._debug_symbol_d_debug( "_debug_ ERROR ===> duplicate global label, ") + label); } else { int _debug_symbol_cgrop = S.lastIndexOf(_debug_symbol_000l+l_0000+ PCEncrypt._debug_symbol_d_debug( "_debug_{"),grop); int _debug_symbol_cgris = S.indexOf(_debug_symbol_000l+l_0000+ PCEncrypt._debug_symbol_d_debug( "_debug_}"),index); if((_debug_symbol_cgrop >= 0) && (_debug_symbol_cgris >= 0) && (_debug_symbol_cgrop < _debug_symbol_cgris)) { String O10lO = S.substring(_debug_symbol_cgrop,_debug_symbol_cgris); String _debug_symbol_llnext; do { _debug_symbol_llnext = _debug_symbol_ll + _debug_symbol_llllllll_; _debug_symbol_llllllll_ = new Integer(_debug_symbol_llllllll_.intValue()+1); } while(_debug_symbol_locals.contains(_debug_symbol_llnext)); report = report + l_0000 + PCEncrypt._debug_symbol_d_debug( "_debug_ ") + label + PCEncrypt._debug_symbol_d_debug( "_debug_ --> ")+_debug_symbol_llnext + _debug_symbol_000l; O10lO = replaceAll(O10lO,_debug_symbol_000l+label+l_0101,_debug_symbol_000l+_debug_symbol_llnext+l_0101); O10lO = replaceAll(O10lO,_debug_symbol_0000+label+_debug_symbol_0000,_debug_symbol_0000+_debug_symbol_llnext+_debug_symbol_0000); O10lO = replaceAll(O10lO,_debug_symbol_0000+label+_debug_symbol_lllllll_,_debug_symbol_0000+_debug_symbol_llnext+_debug_symbol_lllllll_); O10lO = replaceAll(O10lO,_debug_symbol_0000+label+_debug_symbol_000l,_debug_symbol_0000+_debug_symbol_llnext+_debug_symbol_000l); O10lO = replaceAll(O10lO,_debug_symbol_lllllll_+label+_debug_symbol_lllllll_,_debug_symbol_lllllll_+_debug_symbol_llnext+_debug_symbol_lllllll_); O10lO = replaceAll(O10lO,_debug_symbol_lllllll_+label+_debug_symbol_0000,_debug_symbol_lllllll_+_debug_symbol_llnext+_debug_symbol_0000); O10lO = replaceAll(O10lO,_debug_symbol_lllllll_+label+_debug_symbol_000l,_debug_symbol_lllllll_+_debug_symbol_llnext+_debug_symbol_000l); O10lO = replaceAll(O10lO,_debug_symbol_0000+label+l_0000,_debug_symbol_0000+_debug_symbol_llnext+l_0000); O10lO = replaceAll(O10lO,_debug_symbol_lllllll_+label+l_0000,_debug_symbol_lllllll_+_debug_symbol_llnext+l_0000); S = S.substring(0,_debug_symbol_cgrop) + O10lO + S.substring(_debug_symbol_cgris); } else { System.out.println(l_0000+ PCEncrypt._debug_symbol_d_debug( "_debug_ ERROR ===> unable to _l0l0l0l0l0l0l0l0l0l0ll0 dupplicate label, ") + label); } } } index = index + l_0101.length(); } } return S + report; } static int indexOf(String S, String _debug_symbol_sought, int grop) { int looooloool = S.indexOf(_debug_symbol_sought,grop); if(looooloool >= 0) { int _debug_symbol_earlier0_l = S.lastIndexOf(_debug_symbol_000l,looooloool); int _debug_symbol_earlierl_0000 = S.lastIndexOf(l_0000,looooloool); if(_debug_symbol_earlier0_l < _debug_symbol_earlierl_0000) { looooloool = indexOf(S,_debug_symbol_sought,(looooloool+_debug_symbol_sought.length())); } } return looooloool; } static String replaceAll(String S, String l010l0l, String l010101) { int _debug_symbol_l0l0 = 0; int _debug_symbol_prev = _debug_symbol_l0l0; while(_debug_symbol_prev < S.length()) { _debug_symbol_l0l0 = S.indexOf(l010l0l,_debug_symbol_prev); if(_debug_symbol_l0l0 >= 0) { S = S.substring(0,_debug_symbol_l0l0) + l010101 + S.substring(_debug_symbol_l0l0+l010l0l.length()); _debug_symbol_l0l0 = _debug_symbol_l0l0 + l010l0l.length(); } else { _debug_symbol_l0l0 = S.length(); } _debug_symbol_prev = _debug_symbol_l0l0; } return S; } }
;************************************************************************
; String subprogram that compares two strings (Sobjects) and 
; returns a number less than zero if the first object is lexiographicall
; before (i.e. less than) the second, zero if they are equivalent, and a 
; positive number otherwise.
;
;********  int ScompTo (char[] Sobject1, char[] Sobject2)
;
;-- Arguments -----------------------------------------------------------
Sobject1:  .EQUATE  2             ;formal parameter; address of Sobject
Sobject2:  .EQUATE  4             ;formal parameter; address of Sobject
;-- Local Data ----------------------------------------------------------
hold2:    .BLOCK    2
;-- Entry Point ---------------------------------------------------------
          .GLOBAL   ScompTo
ScompTo:   SAVEX
;<<<<<<<<< Instrumentation
           STRO     Sobject1,sf
           CHARO    '-',i
           STRO     Sobject2,sf
;>>>>>>>>>
           CLRA                   ;  A = 0;
loop:	   INCX
	   LDA	    SObject2,sxf
	   STA	    hold2,d
	   LDA	    SObject1,sxf
	   SUBA	    hold2,d
	   CPA	    0,i
	   BRNE	    done
	   CPA	    x00,i
	   BREQ	    done
done:      RESTOREX
;<<<<<<<<< Instrumentation
           CHARO    ',',i
           DECOA
           CHARO    '\n',i
;>>>>>>>>>
           RET0                   ;
;************************************************************************
; String length subprogram that returns the count of the number of
; characters in the string.
;
;********  int Slength (char[] Sobject)
;
;-- Arguments -----------------------------------------------------------
Sobjectl:  .EQUATE  2             ;formal parameter; address of Sobject
;-- Local Data ----------------------------------------------------------
;-- Entry Point ---------------------------------------------------------
Slength:   NOP0
           SAVEX
           CLRA                   ;  A = 0;
           CLRX                   ;  X = 0;
loopl:     LDBYTEA  Sobjectl,sxf  ;+ while(Sobjectl[X] != 0x00) {
           CPA      0,i           ;|
           BREQ     donel         ;|
           ADDX     1,i           ;|   X = x + 1;
           BR       loopl         ;+ }
donel:     STX      -2,s          ;+ A = X;
           RESTOREX
           LDA      -2,s          ;+
           RET0                   ;
;-----------------------------------------------------------
; int sortStgs(address p[], int n);
;-----------------------------------------------------------
p:         .EQUATE  8
n:         .EQUATE  10
;----------
dmax:      .EQUATE  0
pmax:      .EQUATE  2
temp:      .EQUATE  4
;----------
           .GLOBAL  sortStgs
sortStgs:  SUBSP    6,i            ;   Reserve Space
;---------
; S t u b b e d
;---------
done:      ADDSP    6,i            ;+ return
           RET0                    ;+
;SortStrings.pep2 - read, print and sort an array of strings
;
; P.M.J., April 2016
;---------------------------------------------------------------
           BR        main
           .INCLUDE  "PEP2.pep1"
           .APPEND   "readStgs.pep2"
           .APPEND   "prntStgs.pep2"
           .APPEND   "sortStgs.pep2"
           .APPEND   "memcpy.pep2"
           .APPEND   "Slength.pep2"
           .APPEND   "ScompTo.pep2"
;---------------------------------------------------------------
prompt:    .ASCII   "Enter:\x00"
msgunord:  .ASCII   "Unordered...\n\x00"
msgord:    .ASCII   "Ordered...\n\x00"
;--------
LENGTH:    .EQUATE   31            ; Expresses the maximum length of a string
LIMIT:     .EQUATE   24            ; Expresses the capacity of the array
           .ASCII    "<<<<<<<<"    ; Just a marker for visual inspection
p:         .BLOCK    48            ; The array of pointers; LIMIT * 2
           .ASCII    "--------"    ; Just a marker for visual inspection
a:         .BLOCK    768           ; The array of strings; (1+LENGTH) * LIMIT
           .ASCII    ">>>>>>>>"    ; Just a marker for visual inspection
count:     .BLOCK    2             ; The number of strings read and stored
;--------
;---------------------------------------------------------------
main:      NOP0
           PUSH      LENGTH,i
           PUSH      LIMIT,i
           PUSH      a,i
           PUSH      p,i
           CALL      readStgs
           ADDSP     8,i
           STA       count,d
;--------
           DECO      count,d
           CHARO     '\n',i
;--------
           STRO      msgunord,d
           PUSH      count,d
           PUSH      p,i
           CALL      prntStgs
           ADDSP     4,i
;--------
           PUSH      count,d
           PUSH      p,i
           CALL      sortStgs
           ADDSP     4,i
;--------
           STRO      msgord,d
           PUSH      count,d
           PUSH      p,i
           CALL      prntStgs
           ADDSP     4,i
done:      STOP
           .END
           .GLOBAL  STRInput
STRInput:  NOP0
Sobject:   .EQUATE  6
capacity:  .EQUATE  0
ignored:   .EQUATE  2
           SUBSP    4,i
           LDA      0,i
           STA      ignored,s
           LDX      -1,i
           LDA      0,i
           LDBYTEA  Sobject,sxf
           STA      capacity,s
           LDX      0,i
           CPX      capacity,s
           BRGE     error
           LDA      0,i
loop:      CPX      capacity,s
           BREQ     full
           CHARI    Sobject,sxf
           LDBYTEA  Sobject,sxf
           CPA      '\n',i
           BREQ     done
           ADDX     1,i
           BR       loop
full:      LDA      ignored,s
           ADDA     1,i
           STA      ignored,s
           SUBX     1,i
ignore:    CHARI    Sobject,sxf
           LDA      0,i
           LDBYTEA  Sobject,sxf
           CPA      '\n',i
           BREQ     done
           LDA      ignored,s
           ADDA     1,i
           STA      ignored,s
           BR       ignore
done:      LDBYTEA  0,i
           STBYTEA  Sobject,sxf
           LDA      ignored,s
           BR       return
error:     LDA      -1,i
return:    RET4
;PMJ's MPP ver2012.0 ...
br	main
;                                                                        
;{ PEP2.pep1 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
;-------------------------------------------------------------------
; Global "low memory" locations used for temporary static storage
;.GLOBAL    TEMP
TEMP:     .BLOCK     4
;.GLOBAL    JUNK
JUNK:  .BLOCK     2
;.GLOBAL    SAVED
SAVED:    .BLOCK     2
;.GLOBAL    SAVEA
SAVEA:    .BLOCK     2        ;where A is saved statically
;.GLOBAL    SAVEX
SAVEX:    .BLOCK     2        ;where X is saved statically
;.GLOBAL    SAVEPP
SAVEPP:   .BLOCK     2
;============================================================
;============================================================
;============================================================
;-------------------------------------------------------------CC Corruption
; Macro to dump the top portion of the stack
;============================================================
;} PEP2.pep1 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
null:	.EQUATE	x00
one:	.BLOCK	31
two:	.BLOCK	31
main:	NOP0
loop:	STRI	one,d
STRI	two,d
LDA	one,dxf
CPA	null,d
BREQ	done
PUSH	one,d
PUSH	two,d
CALL	SCompTo
BR	loop
done:	STOP
BR STOPEND
;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
;                                                                        
;{ STRInput.pep1 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
;.GLOBAL  STRInput
STRInput:  NOP0
Sobject:   .EQUATE  6
capacity:  .EQUATE  0
ignored:   .EQUATE  2
SUBSP    4,i
LDA      0,i
STA      ignored,s
LDX      -1,i
LDA      0,i
LDBYTEA  Sobject,sxf
STA      capacity,s
LDX      0,i
CPX      capacity,s
BRGE     error
LDA      0,i
loop:      CPX      capacity,s
BREQ     full
CHARI    Sobject,sxf
LDBYTEA  Sobject,sxf
CPA      '\n',i
BREQ     done
ADDX     1,i
BR       loop
full:      LDA      ignored,s
ADDA     1,i
STA      ignored,s
SUBX     1,i
ignore:    CHARI    Sobject,sxf
LDA      0,i
LDBYTEA  Sobject,sxf
CPA      '\n',i
BREQ     done
LDA      ignored,s
ADDA     1,i
STA      ignored,s
BR       ignore
done:      LDBYTEA  0,i
STBYTEA  Sobject,sxf
LDA      ignored,s
BR       return
error:     LDA      -1,i
return:    RET4
;} STRInput.pep1 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;                                                                        
;{ BINOutpt.pep1 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
;.GLOBAL  BINOutpt
m:         .EQUATE  4
BINOutpt:  NOP0
SUBSP    0,i
STA      SAVED,d
LDA      0,i
STA      -2,s
SUBSP    2,i
LDA      SAVED,d
STA      SAVEA,d
STX      SAVEX,d
LDA      m,s
LDX      16,i
BINOloop:  NOP0
CPX      0,i
BREQ     BINOdone
ROLA
BRC      BINO1
BINO0:     CHARO    '0',i
BR       BINOnext
BINO1:     CHARO    '1',i
BINOnext:  NOP0
SUBX     1,i
BR       BINOloop
BINOdone:  NOP0
LDX      SAVEX,d
LDA      SAVEA,d
ADDSP    0,s
ADDSP    2,i
RET0
;} BINOutpt.pep1 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;                                                                        
;{ HEXOutpt.pep1 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
;.GLOBAL  HEXOutpt
Hm:        .EQUATE  4
HEXtext:   .block   4
.word    0
HEXOutpt:  NOP0
SUBSP    0,i
STA      SAVED,d
LDA      0,i
STA      -2,s
SUBSP    2,i
LDA      SAVED,d
STA      SAVEA,d
STX      SAVEX,d
LDA      Hm,s
LDX      3,i
HEXOloop:  NOP0
CPX      0,i
BRLT     HEXOdone
ANDA     0x000F,i
CPA      10,i
BRLT     HEX1
ADDA     0x0007,i
HEX1:      ADDA     0x0030,i
STBYTEA  HEXtext,x
LDA      Hm,s
RORA
RORA
RORA
RORA
STA      Hm,s
SUBX     1,i
BR       HEXOloop
HEXOdone:  STRO     HEXtext,d
LDX      SAVEX,d
LDA      SAVEA,d
ADDSP    0,s
ADDSP    2,i
RET0
;} HEXOutpt.pep1 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;                                                                        
;{ DUMPS.pep1 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
;.GLOBAL  DumpS
Acopy:     .BLOCK   2
Xcopy:     .BLOCK   2
display:   .BLOCK   2
actual:    .BLOCK   2
dmsg:      .ASCII   "------------------------------- DUMPS\n\x00"
cmsg:      .ASCII   ",\x00"
amsg:      .ASCII   "(A=\x00"
xmsg:      .ASCII   "(X=\x00"
dlmsg:     .ASCII   ": \x00"
DumpSN:    .EQUATE  2
DumpS:     NOP0
STA      Acopy,d
STX      Xcopy,d
STRO     dmsg,d
STA      actual,d
STRO     amsg,d
STA      SAVEPP,d
LDA      actual,d
STA      -2,s
SUBSP    2,i
LDA      SAVEPP,d
CALL     HEXOutpt
ADDSP    2,i
STRO     cmsg,d
DECO     actual,d
CHARO    ')',i
STRO     cmsg,d
STX      actual,d
STRO     xmsg,d
STA      SAVEPP,d
LDA      actual,d
STA      -2,s
SUBSP    2,i
LDA      SAVEPP,d
CALL     HEXOutpt
ADDSP    2,i
STRO     cmsg,d
DECO     actual,d
CHARO    ')',i
CHARO    '\n',i
LDX      DumpSN,s
MOVSPA
ADDA     4,i
STA      actual,d
DumpLoop:  CPX      0,i
BRLE     DumpDone
STA      SAVEPP,d
LDA      actual,d
STA      -2,s
SUBSP    2,i
LDA      SAVEPP,d
CALL     HEXOutpt
ADDSP    2,i
STRO     dlmsg,d
LDA      actual,n
STA      display,d
STA      SAVEPP,d
LDA      display,d
STA      -2,s
SUBSP    2,i
LDA      SAVEPP,d
CALL     HEXOutpt
ADDSP    2,i
STRO     cmsg,d
DECO     display,d
CHARO    '\n',i
LDA      actual,d
ADDA     2,i
STA      actual,d
SUBX     2,i
BR       DumpLoop
DumpDone:  LDX      Xcopy,d
LDA      Acopy,d
RET0
;} DUMPS.pep1 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;                                                                        
;{ SCompTo.pep2 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
;************************************************************************
; String subprogram that compares two strings (Sobjects) and
; returns a number less than zero if the first object is lexiographicall
; before (i.e. less than) the second, zero if they are equivalent, and a
; positive number otherwise.
;
;********  int ScompTo (char[] Sobject1, char[] Sobject2)
;
;-- Arguments -----------------------------------------------------------
Sobject1:  .EQUATE  2             ;formal parameter; address of Sobject
Sobject2:  .EQUATE  4             ;formal parameter; address of Sobject
;-- Local Data ----------------------------------------------------------
hold2:    .BLOCK    2
;-- Entry Point ---------------------------------------------------------
;.GLOBAL   ScompTo
;;ScompTo:SAVEX    ; 
ScompTo: NOP0 ;< SAVEX >
STX        SAVEX,d;< SAVEX >
;<<<<<<<<< Instrumentation
STRO     Sobject1,sf
CHARO    '-',i
STRO     Sobject2,sf
;>>>>>>>>>
;;CLRA                  ;  A = 0; ; 
LDA        0,i;< CLRA >
;;loop:INCX  ; 
loop: NOP0 ;< INCX >
ADDX       1,i;< INCX >
LDA	    SObject2,sxf
STA	    hold2,d
LDA	    SObject1,sxf
SUBA	    hold2,d
CPA	    0,i
BRNE	    done
CPA	    x00,i
BREQ	    done
;;done:RESTOREX ; 
done: NOP0 ;< RESTOREX >
LDX        SAVEX,d;< RESTOREX >
;<<<<<<<<< Instrumentation
CHARO    ',',i
;;DECOA  ; 
STA        TEMP,d;< DECOA >
DECO       TEMP,d;< DECOA >
CHARO    '\n',i
;>>>>>>>>>
RET0                   ;
;} SCompTo.pep2 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
STOPEND: STOP
.END
;PMJ's MPP ver2012.0 ...
br	main
;                                                                        
;{ PEP2.pep1 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
;-------------------------------------------------------------------
; Global "low memory" locations used for temporary static storage
;.GLOBAL    TEMP
TEMP:     .BLOCK     4
;.GLOBAL    JUNK
JUNK:  .BLOCK     2
;.GLOBAL    SAVED
SAVED:    .BLOCK     2
;.GLOBAL    SAVEA
SAVEA:    .BLOCK     2        ;where A is saved statically
;.GLOBAL    SAVEX
SAVEX:    .BLOCK     2        ;where X is saved statically
;.GLOBAL    SAVEPP
SAVEPP:   .BLOCK     2
;============================================================
;============================================================
;============================================================
;-------------------------------------------------------------CC Corruption
; Macro to dump the top portion of the stack
;============================================================
;} PEP2.pep1 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
null:	.EQUATE	x00
one:	.BLOCK	31
two:	.BLOCK	31
main:	NOP0
loop:	STRI	one,d
STRI	two,d
LDA	one,dxf
CPA	null,d
BREQ	done
PUSH	one,d
PUSH	two,d
CALL	SCompTo
BR	loop
done:	STOP
BR STOPEND
;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
;                                                                        
;{ STRInput.pep1 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
;.GLOBAL  STRInput
STRInput:  NOP0
Sobject:   .EQUATE  6
capacity:  .EQUATE  0
ignored:   .EQUATE  2
SUBSP    4,i
LDA      0,i
STA      ignored,s
LDX      -1,i
LDA      0,i
LDBYTEA  Sobject,sxf
STA      capacity,s
LDX      0,i
CPX      capacity,s
BRGE     error
LDA      0,i
LL0:      CPX      capacity,s
BREQ     full
CHARI    Sobject,sxf
LDBYTEA  Sobject,sxf
CPA      '\n',i
BREQ     LL1
ADDX     1,i
BR       LL0
full:      LDA      ignored,s
ADDA     1,i
STA      ignored,s
SUBX     1,i
ignore:    CHARI    Sobject,sxf
LDA      0,i
LDBYTEA  Sobject,sxf
CPA      '\n',i
BREQ     LL1
LDA      ignored,s
ADDA     1,i
STA      ignored,s
BR       ignore
LL1:      LDBYTEA  0,i
STBYTEA  Sobject,sxf
LDA      ignored,s
BR       return
error:     LDA      -1,i
return:    RET4
;} STRInput.pep1 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;                                                                        
;{ BINOutpt.pep1 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
;.GLOBAL  BINOutpt
m:         .EQUATE  4
BINOutpt:  NOP0
SUBSP    0,i
STA      SAVED,d
LDA      0,i
STA      -2,s
SUBSP    2,i
LDA      SAVED,d
STA      SAVEA,d
STX      SAVEX,d
LDA      m,s
LDX      16,i
BINOloop:  NOP0
CPX      0,i
BREQ     BINOdone
ROLA
BRC      BINO1
BINO0:     CHARO    '0',i
BR       BINOnext
BINO1:     CHARO    '1',i
BINOnext:  NOP0
SUBX     1,i
BR       BINOloop
BINOdone:  NOP0
LDX      SAVEX,d
LDA      SAVEA,d
ADDSP    0,s
ADDSP    2,i
RET0
;} BINOutpt.pep1 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;                                                                        
;{ HEXOutpt.pep1 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
;.GLOBAL  HEXOutpt
Hm:        .EQUATE  4
HEXtext:   .block   4
.word    0
HEXOutpt:  NOP0
SUBSP    0,i
STA      SAVED,d
LDA      0,i
STA      -2,s
SUBSP    2,i
LDA      SAVED,d
STA      SAVEA,d
STX      SAVEX,d
LDA      Hm,s
LDX      3,i
HEXOloop:  NOP0
CPX      0,i
BRLT     HEXOdone
ANDA     0x000F,i
CPA      10,i
BRLT     HEX1
ADDA     0x0007,i
HEX1:      ADDA     0x0030,i
STBYTEA  HEXtext,x
LDA      Hm,s
RORA
RORA
RORA
RORA
STA      Hm,s
SUBX     1,i
BR       HEXOloop
HEXOdone:  STRO     HEXtext,d
LDX      SAVEX,d
LDA      SAVEA,d
ADDSP    0,s
ADDSP    2,i
RET0
;} HEXOutpt.pep1 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;                                                                        
;{ DUMPS.pep1 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
;.GLOBAL  DumpS
Acopy:     .BLOCK   2
Xcopy:     .BLOCK   2
display:   .BLOCK   2
actual:    .BLOCK   2
dmsg:      .ASCII   "------------------------------- DUMPS\n\x00"
cmsg:      .ASCII   ",\x00"
amsg:      .ASCII   "(A=\x00"
xmsg:      .ASCII   "(X=\x00"
dlmsg:     .ASCII   ": \x00"
DumpSN:    .EQUATE  2
DumpS:     NOP0
STA      Acopy,d
STX      Xcopy,d
STRO     dmsg,d
STA      actual,d
STRO     amsg,d
STA      SAVEPP,d
LDA      actual,d
STA      -2,s
SUBSP    2,i
LDA      SAVEPP,d
CALL     HEXOutpt
ADDSP    2,i
STRO     cmsg,d
DECO     actual,d
CHARO    ')',i
STRO     cmsg,d
STX      actual,d
STRO     xmsg,d
STA      SAVEPP,d
LDA      actual,d
STA      -2,s
SUBSP    2,i
LDA      SAVEPP,d
CALL     HEXOutpt
ADDSP    2,i
STRO     cmsg,d
DECO     actual,d
CHARO    ')',i
CHARO    '\n',i
LDX      DumpSN,s
MOVSPA
ADDA     4,i
STA      actual,d
DumpLoop:  CPX      0,i
BRLE     DumpDone
STA      SAVEPP,d
LDA      actual,d
STA      -2,s
SUBSP    2,i
LDA      SAVEPP,d
CALL     HEXOutpt
ADDSP    2,i
STRO     dlmsg,d
LDA      actual,n
STA      display,d
STA      SAVEPP,d
LDA      display,d
STA      -2,s
SUBSP    2,i
LDA      SAVEPP,d
CALL     HEXOutpt
ADDSP    2,i
STRO     cmsg,d
DECO     display,d
CHARO    '\n',i
LDA      actual,d
ADDA     2,i
STA      actual,d
SUBX     2,i
BR       DumpLoop
DumpDone:  LDX      Xcopy,d
LDA      Acopy,d
RET0
;} DUMPS.pep1 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;                                                                        
;{ SCompTo.pep2 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
;************************************************************************
; String subprogram that compares two strings (Sobjects) and
; returns a number less than zero if the first object is lexiographicall
; before (i.e. less than) the second, zero if they are equivalent, and a
; positive number otherwise.
;
;********  int ScompTo (char[] Sobject1, char[] Sobject2)
;
;-- Arguments -----------------------------------------------------------
Sobject1:  .EQUATE  2             ;formal parameter; address of Sobject
Sobject2:  .EQUATE  4             ;formal parameter; address of Sobject
;-- Local Data ----------------------------------------------------------
hold2:    .BLOCK    2
;-- Entry Point ---------------------------------------------------------
;.GLOBAL   ScompTo
;;ScompTo:SAVEX    ; 
ScompTo: NOP0 ;< SAVEX >
STX        SAVEX,d;< SAVEX >
;<<<<<<<<< Instrumentation
STRO     Sobject1,sf
CHARO    '-',i
STRO     Sobject2,sf
;>>>>>>>>>
;;CLRA                  ;  A = 0; ; 
LDA        0,i;< CLRA >
;;loop:INCX  ; 
LL2: NOP0 ;< INCX >
ADDX       1,i;< INCX >
LDA	    SObject2,sxf
STA	    hold2,d
LDA	    SObject1,sxf
SUBA	    hold2,d
CPA	    0,i
BRNE	    LL3
CPA	    x00,i
BREQ	    LL3
;;done:RESTOREX ; 
LL3: NOP0 ;< RESTOREX >
LDX        SAVEX,d;< RESTOREX >
;<<<<<<<<< Instrumentation
CHARO    ',',i
;;DECOA  ; 
STA        TEMP,d;< DECOA >
DECO       TEMP,d;< DECOA >
CHARO    '\n',i
;>>>>>>>>>
RET0                   ;
;} SCompTo.pep2 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
STOPEND: STOP
.END
;Resolver Report:
; loop --> LL0
; done --> LL1
; loop --> LL2
; done --> LL3

	br	main

	.INCLUDE "PEP2.pep1"

null:	.EQUATE	x00
one:	.BLOCK	31
two:	.BLOCK	31
	.APPEND	"SCompTo.pep2"

main:	NOP0
loop:	STRI	one,d
	STRI	two,d
	LDA	one,dxf
	CPA	null,d
	BREQ	done
	PUSH	one,d
	PUSH	two,d
	CALL	SCompTo
	BR	loop
done:	STOP
	.END
