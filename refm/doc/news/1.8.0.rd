###nonref

= 1.6.8����1.8.0�ؤ��ѹ���(�ޤȤ�)

* ((<1.6.8����1.8.0�ؤ��ѹ���(�ޤȤ�)/���󥿥ץ꥿���ѹ�>))
* ((<1.6.8����1.8.0�ؤ��ѹ���(�ޤȤ�)/�ɲä��줿���饹���⥸�塼��>))
* ((<1.6.8����1.8.0�ؤ��ѹ���(�ޤȤ�)/�ɲä��줿�᥽�å�>))
* ((<1.6.8����1.8.0�ؤ��ѹ���(�ޤȤ�)/�ɲä��줿���>))
* ((<1.6.8����1.8.0�ؤ��ѹ���(�ޤȤ�)/��ĥ���줿���饹���᥽�å�(�ߴ����Τ����ѹ�)>))
* ((<1.6.8����1.8.0�ؤ��ѹ���(�ޤȤ�)/�ѹ����줿���饹���᥽�å�(�ߴ����Τʤ��ѹ�)>))
* ((<1.6.8����1.8.0�ؤ��ѹ���(�ޤȤ�)/ʸˡ���ѹ�>))
* ((<1.6.8����1.8.0�ؤ��ѹ���(�ޤȤ�)/����ɽ��>))
* ((<1.6.8����1.8.0�ؤ��ѹ���(�ޤȤ�)/Marshal>))
* ((<1.6.8����1.8.0�ؤ��ѹ���(�ޤȤ�)/Windows �б�>))
* ((<1.6.8����1.8.0�ؤ��ѹ���(�ޤȤ�)/�ѻߤ��줿(�����ͽ���)��ǽ>))
* ((<1.6.8����1.8.0�ؤ��ѹ���(�ޤȤ�)/�饤�֥��>))
* ((<1.6.8����1.8.0�ؤ��ѹ���(�ޤȤ�)/��ĥ�饤�֥��API>))
* ((<1.6.8����1.8.0�ؤ��ѹ���(�ޤȤ�)/�Х�����>))
* ((<1.6.8����1.8.0�ؤ��ѹ���(�ޤȤ�)/���ݡ��ȥץ�åȥե�������ɲ�>))

== ���󥿥ץ꥿���ѹ�

: ((<�Ȥ߹����ѿ�/$defout>)) [obsolete]
: ((<�Ȥ߹����ѿ�/$deferr>)) [obsolete]
: ((<�Ȥ߹����ѿ�/$stdout>)) [change]
: ((<�Ȥ߹����ѿ�/$stderr>)) [change]
: ((<�Ȥ߹����ѿ�/$stdin>))  [change]

  $stdout, $stderr �ϡ�$defout, $deferr ����̾�ˤʤ�
  $defout, $deferr �� ((<obsolete>)) �ˤʤ�ޤ���

  $stdin �ϡ����̤Υ������Х��ѿ��Ȥʤ�ޤ���(STDIN�������쥯�Ȥ���
  ư��Ϥʤ��ʤ�ޤ���)

  $defout �� $deferr ��������Ԥ��ȷٹ𤬤Ǥޤ���
  (����1.6 �� $deferr �Ϥ���ޤ���)
  ((<ruby-dev:20961>))

  $stdin �˥��֥������Ȥ����������ɸ�����Ϥ�������ϥ᥽�å�(gets ��)
  �Ϥ��Υ��֥������Ȥ˥᥽�åɤ��ꤲ�ޤ���
  (������쥯�Ȥ��ʤ��ʤä���������С�1.6 �Ȥ���ۤɰ㤤�Ϥʤ��褦�Ǥ�)

: ((<�Ȥ߹����ѿ�/$VERBOSE>))

  ���ʳ��Υ�٥����Ĥ褦�ˤʤ�ޤ�����
  * nil: �ٹ����Ϥ��ʤ�   (-W0 �������ٹ��٥�)
  * false: ���פʷٹ�Τ߽���  (-W1 �ǥե����)
  * true: ���٤Ƥηٹ����Ϥ��� (-W2 or -W or -v or -w or --verbose)

  �ɲä��줿 -W ���ץ����� $VERBOSE = nil �λ���(-W0)���ǽ�ˤ��ޤ���

: ruby interpreter [ruby] [change]

  ���饹���ðۥ��饹���ðۥ��饹���ðۥ��饹���ȤǤ�����������ޤ���
  ((<ruby-bugs-ja:313>))���ʤ�����褯�狼��ޤ���(^^;

        class << Object
          p [self.id, self]
          class << self
            p [self.id, self]
          end
        end
        => ruby 1.6.7 (2002-03-01) [i586-linux]
           [537771634, Class]
           [537742484, Class]
        => ruby 1.7.3 (2002-09-05) [i586-linux]
           [537771634, #<Class:Object>]
           [537771634, #<Class:Object>]

  ����ˡ����֥������Ȥ��ðۥ��饹�Υ����ѡ����饹���ðۥ��饹��
  ���֥������Ȥ��ðۥ��饹���ðۥ��饹�Υ����ѡ����饹��Ʊ���ʤΤ������Ǥ�
  ((<ruby-bugs-ja:324>))�������äѤ�狼��ޤ���(^^;;

        class << Object.new
          class << self.superclass
            p [self.id, self]
          end
          class << self
            p [self.superclass.id, self.superclass]
          end
        end
        => ruby 1.6.7 (2002-03-01) [i586-linux]
           [537771634, Class]
           [537771644, Class]
        => ruby 1.7.3 (2002-09-05) [i586-linux]
           [537771634, #<Class:Object>]
           [537771634, #<Class:Object>]

  ((<ruby-bugs-ja:336>)) �Τ�����Ǥޤ������Ѥ�ä����⤷��ޤ���
  (2002-09-21 �� ChangeLog ���ȡ��ޤ���ˤ��ä�����Τ���줿�餷��
  ^^;;)

: ((<Proc/Proc.new>)) [change]
: ((<�Ȥ߹��ߴؿ�/lambda>))   [change]
: ((<�Ȥ߹��ߴؿ�/proc>))     [change]

  �ʲ��Τ褦���ѹ�����ޤ�����((<ruby-dev:20358>))

      * Proc.new ����ӥ֥��å�������Ϳ������ Proc ��
        ���������å�����뤤��break ���㳰�ˤʤ롣

            Proc.new {|a,b,c| p [a,b,c]}.call(1,2)
                => -:1: wrong # of arguments (2 for 3) (ArgumentError)
                        from -:1:in `call'
                        from -:1
                   ruby 1.6.8 (2002-12-24) [i586-linux]
                => ruby 1.8.0 (2003-06-21) [i586-linux]
                   [1, 2, nil]

            Proc.new { break }.call

                => ruby 1.6.8 (2002-12-24) [i586-linux]

                => -:1:in `call': break from proc-closure (LocalJumpError)
                        from -:1
                   ruby 1.8.0 (2003-06-21) [i586-linux]

      * lambda ����� proc ���֤� Proc �ϰ��������å�����������
        break �ϼ¹Ԥ����Ǥ��롣

            lambda {|a,b,c| p [a,b,c]}.call(1,2)
                => -:1: wrong # of arguments (2 for 3) (ArgumentError)
                        from -:1:in `call'
                        from -:1
                   ruby 1.6.8 (2002-12-24) [i586-linux]
                => -:1: wrong number of arguments (2 for 3) (ArgumentError)
                        from -:1:in `call'
                        from -:1
                   ruby 1.8.0 (2003-06-21) [i586-linux]

            lambda { break }.call
                => ruby 1.6.8 (2002-12-24) [i586-linux]
                => ruby 1.8.0 (2003-06-21) [i586-linux]


  �ʲ��Τ褦�˥��ƥ졼���֥��å��ȡ�Proc��֥��å��Ȥ��ư������Ϥ�����
  ���ε�ư��Ʊ���ˤʤäƤ��ޤ���

        def foo
          yield 1,2,3,4
        end

        foo {|a,b,c| p [a,b,c]; break }

        foo( &proc {|a,b,c| p [a,b,c]; break } )

        foo( &Proc.new {|a,b,c| p [a,b,c]; break } )

        => ruby 1.6.8 (2002-12-24) [i586-linux]
           [1, 2, 3]
           [1, 2, 3]
           -:2: break from proc-closure (LocalJumpError)
        => ruby 1.8.0 (2003-06-21) [i586-linux]
           [1, 2, 3]
           [1, 2, 3]
           [1, 2, 3]

: ((<yield|�᥽�åɸƤӽФ�/yield>))

  �֥��å��ѥ�᡼���ο�����Ĥξ�硢�֥��å���ʣ�����ͤ��Ϥ��ȷٹ�
  �Ф�褦�ˤʤ�ޤ�����

  ������ |var| �ϰ�Ĥΰ����������Ȥ��ȡ�ʣ���ΰ����������Ȥ���ξ
  �������Ѥ���Ƥ��ޤ�����������ϡְ�Ĥΰ����������פ��Ȥ��̣����
  �褦�ˤʤ�ޤ���((<ruby-dev:20358>))

: defined? [compat]

  °���������������Ǥؤ��������Ф��� "method" �Ǥʤ� "assignment" ����
  ���褦�ˤʤ�ޤ�����

: ((<��ƥ��/���ͥ�ƥ��>)) [compat]

  10��((*����*))��ƥ��� prefix �Ȥ��� 0d ���ɲä���ޤ�����
  8�ʥ�ƥ��� prefix �Ȥ��� 0 �ʳ��� 0o ���ɲä���ޤ�����

  Integer(), String#to_i��String#oct �⤳�� prefix ��ǧ�����ޤ���

: ((<�᥽�åɰ����� & ����|�᥽�åɸƤӽФ�/���ƥ졼��>)) [compat]
: ((<Proc#to_proc|Proc/to_proc>)) [new]

  �᥽�åɤ��Ϥ������� & �򽤾�������硢�Ϥ����֥������Ȥ� to_proc ��
  ���äƤ���Ф����¹Ԥ������η�̤�֥��å��Ȥ����Ϥ��褦�ˤʤ�ޤ�
  ���������ϡ�& �����Ǥ���Τ� Proc, Method ���֥������ȸ���Ǥ�����
  �����ȼ�� Proc#to_proc ���ɲä���ޤ�����

: ��λ���ơ����� [compat]

  raise SystemExit �����Ȥ��˽�λ���ơ����� 1 �ǽ�λ����褦�ˤʤ�ޤ�����
  ((<ruby-dev:16776>))

: ((<"rescue/ensure on begin .. end while"|���湽¤/while ������>)) [compat]

  rescue/ensure ����� begin ���� while/until �����Ǥ���褦�ˤʤ�ޤ�
  ����

  �����ϡ�rescue/ensure ����� while/until �������ϡ��̾�� begin ����
  while/until �������Ƥ���ȸ��ʤ������Τ�ɬ���ǽ�˼¹Ԥ����Ȥ�����
  ��ޤ�(C �� do ... while ��ʸ��Ʊ��)�򤷤Ƥ��ޤ���Ǥ�����
  ((<ruby-list:34618>))

: ((<"rescue/ensure on class/module"|���饹���᥽�åɤ����/���饹���>)) [compat]

  �᥽�å�����Τۤ��ˤ⥯�饹�����⥸�塼������ˤ�rescue/ensure��
  �Ĥ�����褦�ˤʤ�ޤ�����

: [ruby] [compat]

  �����Υϥå���ơ��֥����Ѥ��뤳�Ȥˤ��������Ȥ�®�٤�������������Ǥ���
  (ChangeLog��
        Tue Jun  5 16:15:58 2001  Yukihiro Matsumoto  <matz@ruby-lang.org>
  �˳�������褦�Ǥ�)

: break and next        [compat]

  break, next �ϡ���������ꤹ�뤳�Ȥǥ��ƥ졼���� yield ���ͤ��֤�
  ���Ȥ��Ǥ���褦�ˤʤ�ޤ�����(���ε�ǽ�Ϥޤ��¸��Ǥ�)

  break [n] �ϥ��ƥ졼����λ������n �����Υ��ƥ졼��������ͤˤʤ�ޤ���
  next [n] �ϥ֥��å���ȴ����n �� yield ������ͤˤʤ�ޤ���

: to_str        [compat]

  to_str ������������֥������ȤϤ�깭�ϰϤ�String�Ȥ��ƿ��񤦤褦��
  �ʤ�ޤ�����

  ʸ���������˼��ۤȤ�ɤ��Ȥ߹��ߥ᥽�åɤϡ�to_str �ˤ����ۤ�
  ���Ѵ����ߤޤ���

: �ϰϱ黻�Ҽ���Υ�ƥ�� [ruby] [change]
  �ϰϱ黻�Ҽ����ñ�Ȥο��ͥ�ƥ�뤬 (({$.})) ����Ӥ����Τ�
  -e ���ץ����ˤ��1�ԥ�����ץȤ�������ˤʤ�ޤ�����

: rescue ����㳰���饹��ȯ�������㳰���֥������Ȥ���� [ruby] [change]

  ȯ�������㳰 $! �� rescue ����㳰���饹�Ȥ� ((<Module#===|Module/===>))
  ��Ȥä���Ӥ���褦�ˤʤ�ޤ�����

  ������ kind_of? �ˤ����ӤʤΤǴ���Ū��ư����Ѥ��Ϥ���ޤ��󤬡�
  SystemCallError.=== �����̤� errno �����פ����㳰��Ʊ���ȸ��ʤ��褦
  �˺��������ޤ���������ˤ�ꡢ�㤨�� Errno::EWOULDBLOCK �� 
  Errno::EAGAIN ��Ʊ����̣(Ʊ��errno)�ξ��ˤɤ������ꤷ�Ƥ� rescue 
  �Ǥ���褦�ˤʤ�ޤ�����

  ���θ塢errno �����פ��� Errno::XXX ���֥������Ȥ�Ʊ��Υ��֥�������
  �ˤʤä��ΤǤ����ѹ��θ��̤Ϥʤ��ʤäƤޤ������ѹ����ΤϻĤäƤޤ���
  (�桼�����㳰���饹���������Τ˻Ȥ��뤫�⤷��ޤ���)
  ((<ruby-dev:19589>))

: while, until, class, module, def ����         [ruby] [change]

  while, until, class, module, def �����Ȥ����ͤ��֤��褦�ˤʤ�ޤ�����

  class/module �ϺǸ��ɾ���������η�̤��֤��ޤ���def �� nil ���֤�
  �ޤ���while/until �ϡ��̾� nil ���֤��ޤ�����break �ΰ����ˤ��Ǥ��
  ���ͤ��֤����Ȥ��Ǥ��ޤ���

: ¿������ [change]

  ¿�������ε�§��ľ���ޤ�����

# # derived from sample/test.rb
# a = *[]; p a                            # special case
# def f;  yield; end; f {|a| p a}         # add   (warning)
# def r; return; end; a = r(); p a
#           a = nil; p a
# def f;  yield nil; end; f {|a| p a}
# def r; return nil; end; a = r(); p a
#           a = 1; p a
# def f;  yield 1; end; f {|a| p a}
# def r; return 1; end; a = r(); p a
#           a = []; p a
# def f;  yield []; end; f {|a| p a}
# def r; return []; end; a = r(); p a
#           a = [1]; p a
# def f;  yield [1]; end; f {|a| p a}
# def r; return [1]; end; a = r(); p a
#           a = [nil]; p a
# def f;  yield [nil]; end; f {|a| p a}
# def r; return [nil]; end; a = r(); p a
#           a = [[]]; p a
# def f;  yield [[]]; end; f {|a| p a}
# def r; return [[]]; end; a = r(); p a
#           a = [1,2]; p a
#           a = [*[]]; p a
# def f;  yield [*[]]; end; f {|a| p a}
# def r; return [*[]]; end; a = r(); p a
#           a = [*[1]]; p a
# def f;  yield [*[1]]; end; f {|a| p a}
# def r; return [*[1]]; end; a = r(); p a
#           a = [*[1,2]]; p a
# def f;  yield [*[1,2]]; end; f {|a| p a}
# def r; return [*[1,2]]; end; a = r(); p a
# 
#           a = *nil; p a
# def f;  yield *nil; end; f {|a| p a}
# def r; return *nil; end; a = r(); p a
#           a = *1; p a
# def f;  yield *1; end; f {|a| p a}
# def r; return *1; end; a = r(); p a
#           a = *[]; p a
# def f;  yield *[]; end; f {|a| p a}                 # add (warning)
# def r; return *[]; end; a = r(); p a
#           a = *[1]; p a
# def f;  yield *[1]; end; f {|a| p a}
# def r; return *[1]; end; a = r(); p a
#           a = *[nil]; p a
# def f;  yield *[nil]; end; f {|a| p a}
# def r; return *[nil]; end; a = r(); p a
#           a = *[[]]; p a
# def f;  yield *[[]]; end; f {|a| p a}
# def r; return *[[]]; end; a = r(); p a
#           a = *[1,2]; p a
# def f;  yield *[1,2]; end; f {|a| p a}            # add
# def r; return *[1,2]; end; a = r(); p a         # add
#           a = *[*[]]; p a
# def f;  yield *[*[]]; end; f {|a| p a}            # add(warning)
# def r; return *[*[]]; end; a = r(); p a
#           a = *[*[1]]; p a
# def f;  yield *[*[1]]; end; f {|a| p a}
# def r; return *[*[1]]; end; a = r(); p a
#           a = *[*[1,2]]; p a
# def r; return *[*[1,2]]; end; a = r(); p a
# 
# *a = *[]; p a                          # special case
# def f;  yield; end; f {|*a| p a}
# def r; return; end; *a = r(); p a
#          *a = nil; p a
# def f;  yield nil; end; f {|*a| p a}
# def r; return nil; end; *a = r(); p a
#          *a = 1; p a
# def f;  yield 1; end; f {|*a| p a}
# def r; return 1; end; *a = r(); p a
#          *a = []; p a
# def f;  yield []; end; f {|*a| p a}
# def r; return []; end; *a = r(); p a
#          *a = [1]; p a
# def f;  yield [1]; end; f {|*a| p a}
# def r; return [1]; end; *a = r(); p a
#          *a = [nil]; p a
# def f;  yield [nil]; end; f {|*a| p a}
# def r; return [nil]; end; *a = r(); p a
#          *a = [[]]; p a
# def f;  yield [[]]; end; f {|*a| p a}
# def r; return [[]]; end; *a = r(); p a
#          *a = [1,2]; p a
# def f;  yield [1,2]; end; f {|*a| p a}
# def r; return [1,2]; end; *a = r(); p a
#          *a = [*[]]; p a
# def f;  yield [*[]]; end; f {|*a| p a}
# def r; return [*[]]; end; *a = r(); p a
#          *a = [*[1]]; p a
# def f;  yield [*[1]]; end; f {|*a| p a}
# def r; return [*[1]]; end; *a = r(); p a
#          *a = [*[1,2]]; p a
# def f;  yield [*[1,2]]; end; f {|*a| p a}
# def r; return [*[1,2]]; end; *a = r(); p a
# 
#          *a = *nil; p a
# def f;  yield *nil; end; f {|*a| p a}
# def r; return *nil; end; *a = r(); p a
#          *a = *1; p a
# def f;  yield *1; end; f {|*a| p a}
# def r; return *1; end; *a = r(); p a
#          *a = *[]; p a
# def f;  yield *[]; end; f {|*a| p a}
# def r; return *[]; end; *a = r(); p a
#          *a = *[1]; p a
# def f;  yield *[1]; end; f {|*a| p a}
# def r; return *[1]; end; *a = r(); p a
#          *a = *[nil]; p a
# def f;  yield *[nil]; end; f {|*a| p a}
# def r; return *[nil]; end; *a = r(); p a
#          *a = *[[]]; p a
# def f;  yield *[[]]; end; f {|*a| p a}
# def r; return *[[]]; end; *a = r(); p a
#          *a = *[1,2]; p a
# def f;  yield *[1,2]; end; f {|*a| p a}         # add
# def r; return *[1,2]; end; *a = r(); p a
#          *a = *[*[]]; p a
# def f;  yield *[*[]]; end; f {|*a| p a}
# def r; return *[*[]]; end; *a = r(); p a
#          *a = *[*[1]]; p a
# def f;  yield *[*[1]]; end; f {|*a| p a}
# def r; return *[*[1]]; end; *a = r(); p a
#          *a = *[*[1,2]]; p a
# def f;  yield *[*[1,2]]; end; f {|*a| p a}
# def r; return *[*[1,2]]; end; *a = r(); p a
# 
# a,b,*c = *[]; p [a,b,c]                          # special case
# def f;  yield; end; f {|a,b,*c| p [a,b,c]}
# def r; return; end; a,b,*c = r(); p [a,b,c]
#      a,b,*c = nil; p [a,b,c]
# def f;  yield nil; end; f {|a,b,*c| p [a,b,c]}
# def r; return nil; end; a,b,*c = r(); p [a,b,c]
#      a,b,*c = 1; p [a,b,c]
# def f;  yield 1; end; f {|a,b,*c| p [a,b,c]}
# def r; return 1; end; a,b,*c = r(); p [a,b,c]
#      a,b,*c = []; p [a,b,c]
# def f;  yield []; end; f {|a,b,*c| p [a,b,c]}
# def r; return []; end; a,b,*c = r(); p [a,b,c]
#      a,b,*c = [1]; p [a,b,c]
# def f;  yield [1]; end; f {|a,b,*c| p [a,b,c]}
# def r; return [1]; end; a,b,*c = r(); p [a,b,c]
#      a,b,*c = [nil]; p [a,b,c]
# def f;  yield [nil]; end; f {|a,b,*c| p [a,b,c]}
# def r; return [nil]; end; a,b,*c = r(); p [a,b,c]
#      a,b,*c = [[]]; p [a,b,c]
# def f;  yield [[]]; end; f {|a,b,*c| p [a,b,c]}
# def r; return [[]]; end; a,b,*c = r(); p [a,b,c]
#      a,b,*c = [1,2]; p [a,b,c]
# def f;  yield [1,2]; end; f {|a,b,*c| p [a,b,c]}        # add
# def r; return [1,2]; end; a,b,*c = r(); p [a,b,c]
#      a,b,*c = [*[]]; p [a,b,c]
# def f;  yield [*[]]; end; f {|a,b,*c| p [a,b,c]}
# def r; return [*[]]; end; a,b,*c = r(); p [a,b,c]
#      a,b,*c = [*[1]]; p [a,b,c]
# def f;  yield [*[1]]; end; f {|a,b,*c| p [a,b,c]}
# def r; return [*[1]]; end; a,b,*c = r(); p [a,b,c]
#      a,b,*c = [*[1,2]]; p [a,b,c]
# def f;  yield [*[1,2]]; end; f {|a,b,*c| p [a,b,c]}
# def r; return [*[1,2]]; end; a,b,*c = r(); p [a,b,c]
# 
#      a,b,*c = *nil; p [a,b,c]
# def f;  yield *nil; end; f {|a,b,*c| p [a,b,c]}
# def r; return *nil; end; a,b,*c = r(); p [a,b,c]
#      a,b,*c = *1; p [a,b,c]
# def f;  yield *1; end; f {|a,b,*c| p [a,b,c]}
# def r; return *1; end; a,b,*c = r(); p [a,b,c]
#      a,b,*c = *[]; p [a,b,c]
# def f;  yield *[]; end; f {|a,b,*c| p [a,b,c]}
# def r; return *[]; end; a,b,*c = r(); p [a,b,c]
#      a,b,*c = *[1]; p [a,b,c]
# def f;  yield *[1]; end; f {|a,b,*c| p [a,b,c]}
# def r; return *[1]; end; a,b,*c = r(); p [a,b,c]
#      a,b,*c = *[nil]; p [a,b,c]
# def f;  yield *[nil]; end; f {|a,b,*c| p [a,b,c]}
# def r; return *[nil]; end; a,b,*c = r(); p [a,b,c]
#      a,b,*c = *[[]]; p [a,b,c]
# def f;  yield *[[]]; end; f {|a,b,*c| p [a,b,c]}
# def r; return *[[]]; end; a,b,*c = r(); p [a,b,c]
#      a,b,*c = *[1,2]; p [a,b,c]
# def f;  yield *[1,2]; end; f {|a,b,*c| p [a,b,c]}       # add
# def r; return *[1,2]; end; a,b,*c = r(); p [a,b,c]
#      a,b,*c = *[*[]]; p [a,b,c]
# def f;  yield *[*[]]; end; f {|a,b,*c| p [a,b,c]}
# def r; return *[*[]]; end; a,b,*c = r(); p [a,b,c]
#      a,b,*c = *[*[1]]; p [a,b,c]
# def f;  yield *[*[1]]; end; f {|a,b,*c| p [a,b,c]}
# def r; return *[*[1]]; end; a,b,*c = r(); p [a,b,c]
#      a,b,*c = *[*[1,2]]; p [a,b,c]
# def f;  yield *[*[1,2]]; end; f {|a,b,*c| p [a,b,c]}
# def r; return *[*[1,2]]; end; a,b,*c = r(); p [a,b,c]

: ����Ÿ�� [change]

  �ʲ��ε�ư�������ޤ�����
  ���ߤϡ�1���Ǥ�����������Ÿ������ޤ���

    a = *[1]
    p a #=> [1]

    => ruby 1.6.8 (2002-12-24) [i586-linux]
       [1]
    => ruby 1.7.1 (2001-06-05) [i586-linux]
       1

== �ɲä��줿���饹���⥸�塼��
: ((<Process::UID>))  [new]
: ((<Process::GID>))  [new]
: ((<Process::Sys>))  [new]
: ((<Signal>)) �⥸�塼��       [new]
: ((<Process::Status>))         [new]
: ((<NoMethodError>))   [new]

  ((<Process::Status>)) ���ɲäˤ�ꡢ(({$?})) ���ͤ��������餳�Υ���
  ���Υ��󥹥��󥹤ˤʤ�ޤ�����

=== ���饹����

: ((<File::Constants>))

  File::Constants �ϡ�File ���饹�Ǥʤ� IO ���饹�� include ����褦��
  �ʤ�ޤ�����((<ruby-dev:20964>))

: ((<UnboundMethod>)) [compat]

  UnboundMethod ���饹�� Method ���饹�Υ��֥��饹�ǤϤʤ��ʤ�ޤ�����
  UnboundMethod#call, UnboundMethod#unbind �Ϥʤ��ʤ�ޤ�����
  ((<ruby-core:00927>))


: ((<NameError>)) & ((<NoMethodError>)) [change]

  NameError �� StandardError �Υ��֥��饹���ᤷ�ޤ�����
  ���饹���ؤϰʲ��Τ褦�ˤʤ�ޤ�����

    NoMethodError < NameError < StandardError.

: ((<Interrupt>))                       [change]
  Interrupt �ϡ�((<SignalException>))�Υ��֥��饹�ˤʤ�ޤ�����
  (1.6������Exception�Υ��֥��饹)

== �ɲä��줿�᥽�å�
=== �Ȥ߹��ߴؿ�

: ((<�Ȥ߹��ߴؿ�/warn>))  [new]
: ((<�Ȥ߹����ѿ�/$deferr>)) [new]

  �ɲ�

  �����ϡ�ruby ���󥿥ץ꥿�����Ϥ��� error/warning ��å������� STDERR
  ����Ǥ�������$stderr ���ѹ�����ޤ�����($deferr �Ϥ����� obsolete ��
  �ʤ�ޤ�����$stderr ��ȤäƤ�������)

=== ARGF

: ((<ARGF/ARGF.path>)) [new]

  �ɲ� (ARGF.filename ����̾) ((<ruby-dev:20197>))

=== Array

: ((<Array#transpose|Array/transpose>)) [new]

  �ɲ�

: ((<Array#zip|Enumerable/zip>)) [new]
: ((<Enumerable#zip|Enumerable/zip>)) [new]

  �ɲ�

: ((<Array#fetch|Array/fetch>))     [new]

  �ɲ�

: ((<Array#insert|Array/insert>))     [new]

  �ɲ� ((<ruby-talk:14289>))

  (({ary[n,0] = [other,...]})) ��Ʊ��(������ self ���֤�)

=== Class

: ((<Class#allocate|Class/allocate>))    [new]

    allocate �� initialize ����ĤΥ᥽�åɤǥ��֥������Ȥ�
    ��������褦�ˤʤ�ޤ�����((<ruby-dev:14847>))
    rb_define_alloc_func() �⻲�ȡ�

=== Dir

: ((<Dir#path|Dir/path>))       [new]

  �ɲ�

=== ENV

: ((<ENV/ENV.clear>)) [new]
: ((<ENV/ENV.shift>)) [new]
: ((<ENV/ENV.invert>)) [new]
: ((<ENV/ENV.replace>)) [new]
: ((<ENV/ENV.update>)) [new]

  ((<Hash>)) �Ȥθߴ����Τ�����������ޤ�����

=== Enumerable

: ((<Enumerable#partition|Enumerable/partition>)) [new]

  �ɲ�

: ((<Enumerable#sort_by|Enumerable/sort_by>))      [new]

  �ɲá�((<ruby-dev:8986>))�ʹߤ���Ƥ��줿 Schwartzian transform
  ��Ԥ������ sort �Ǥ���

: ((<Enumerable#all?|Enumerable/all?>))         [new]
: ((<Enumerable#any?|Enumerable/any?>))         [new]
: ((<Enumerable#inject|Enumerable/inject>))       [new]
  �ɲ�

=== File

: ((<File/File.extname>)) [new]

  �ɲá��ե�����̾�γ�ĥ�Ҥ��֤��ޤ���((<ruby-talk:37617>))

: ((<File/File.fnmatch>))     [new]
: ((<File/File.fnmatch?>))    [new]
  �ɲ�

  ���Υ᥽�åɤǻ��Ѥ���ե饰 FNM_NOESCAPE, FNM_PATHNAME, FNM_PERIOD,
  FNM_CASEFOLD ��((<File::Constants>)) �⥸�塼����������ޤ�����

: ((<File/File.lchmod>))     [new]
: ((<File/File.lchown>))     [new]
  �ɲ�

=== File::Stat

: ((<File::Stat#rdev_major|File::Stat/rdev_major>)) [new]
: ((<File::Stat#rdev_minor|File::Stat/rdev_minor>)) [new]

  �ɲ�

=== Float

: ((<Numeric#to_int|Numeric/to_int>)) [new]
: ((<Float#to_int|Numeric/to_int>)) [new]

  �ɲá�

=== Hash

: ((<Hash#merge|Hash/merge>)) [new]
: ((<Hash#merge!|Hash/merge!>)) [new]

  �ɲá�Hash#merge �ϡ�hash.dup.update ��Ʊ����
  Hash#merge! �ϡ�Hash#update ����̾ ((<ruby-talk:59777>)), ((<ruby-dev:19463>))

: ((<Hash#default_proc|Hash/default_proc>)) [new]

  �ɲ� ((<ruby-dev:17966>))

=== IO

: ((<IO/IO.sysopen>)) [new]
: ((<Socket#sysaccept|Socket/sysaccept>)) [new]
: ((<TCPServer#sysaccept|TCPServer/sysaccept>)) [new]
: ((<UNIXServer#sysaccept|UNIXServer/sysaccept>)) [new]

  �ɲ�

: ((<IO#sysseek|IO/sysseek>))  [new]

  �ɲ� ((<ruby-talk:21612>)), ((<ruby-talk:36703>))

: ((<IO#fsync|IO/fsync>))     [new]

  �ɲ�

: ((<IO/IO.open>))  [new]

  �ɲ�

: ((<IO/IO.for_fd>))       [new]
  �ɲ�

: ((<IO/IO.read>))         [new]

  �ɲá�((<ruby-talk:9460>))�������˻�ä��аޤ��Ȼפ�

=== LocalJumpError

: ((<LocalJumpError#exit_value|LocalJumpError/exit_value>)) [new]
: ((<LocalJumpError#reason|LocalJumpError/reason>)) [new]

  �ɲ�

=== Marshal

: ((<Marshal/Object#marshal_load>))  [new]
: ((<Marshal/Object#marshal_dump>))  [new]

  �ɲ� ((<ruby-dev:21016>))

=== MatchData

: ((<MatchData#captures|MatchData/captures>)) [new]

  �ɲá�((<RCR#139>))

: ((<MatchData#select|MatchData/select>)) [new]

  ((<MatchData>)) �ϡ�Enumerable �ǤϤ���ޤ��󤬡�Enumerable#select
  ��Ʊ���᥽�åɤ��������ޤ�����

=== Math

: ((<Math/Math.erf>)) [new]
: ((<Math/Math.erfc>)) [new]

  �ɲ� ((<ruby-list:37753>))

: ((<Math/Math.acos>))          [new]
: ((<Math/Math.asin>))          [new]
: ((<Math/Math.atan>))          [new]
: ((<Math/Math.cosh>))          [new]
: ((<Math/Math.sinh>))          [new]
: ((<Math/Math.tanh>))          [new]
: ((<Math/Math.hypot>))         [new]
    �ɲ�

=== Method

: ((<Method#==|Method/==>)) [new]

  �ɲ�

=== Module

: ((<�Ȥ߹��ߴؿ�/autoload>))  [change]
: ((<�Ȥ߹��ߴؿ�/autoload?>))  [new]
: ((<Module#autoload|Module/autoload>))  [new]
: ((<Module#autoload?|Module/autoload>))  [new]

  �ͥ��Ȥ������饹/�⥸�塼����Ф��� autoload ���꤬��ǽ�ˤʤ�ޤ�����
  ((<ruby-dev:16159>)), ((<ruby-dev:16165>)) ((<ruby-dev:18103>)),
  ((<ruby-dev:19686>))

: ((<Module#const_missing|Module/const_missing>))  [new]

   �������Ƥ��ʤ��������Ѥ����Ȥ��� const_missing �Ȥ���̾�Υ᥽�åɤ�
   �Ƥ֤褦�ˤʤ�ޤ������ǥե���ȤǤ� NameError �㳰��ȯ�������ޤ���
   ((<ruby-core:00441>))

: ((<Module#private_method_defined?|Module/private_method_defined?>)) [new]
: ((<Module#protected_method_defined?|Module/protected_method_defined?>)) [new]

: ((<Module#public_method_defined?|Module/public_method_defined?>)) [new]
: ((<Object#methods|Object/methods>)) [change]
: ((<Module#instance_methods|Module/instance_methods>)) [change]

  �ɲá��ѹ�(���ͤ�����)

: ((<Module#include?|Module/include?>)) [new]

  Added. ((<ruby-dev:13941>))

: ((<Module#included|Module/included>))         [new]

  �ɲá�Module#append_feature �θ�˸ƤФ��hook

: ((<Module#method_removed|Module/method_removed>))   [new]
: ((<Module#method_undefined|Module/method_undefined>)) [new]

  �ɲ�

=== NameError

: ((<NameError#name|NameError/name>))                [new]

  �ɲ�

=== NilClass

: ((<NilClass#to_f|NilClass/to_f>)) [new]

  �ɲ�

=== Numeric

: ((<Numeric#div|Numeric/div>)) [new]
: ((<Numeric#quo|Numeric/quo>)) [new]

  �ɲ�  ((<ruby-dev:19423>))

  ((<ruby-dev:20962>))

      * div    - ����(divmod���������)
      * /      - ���ο����Ǥ�äȤ⼫���ʾ�(�����Ϥ������������)
      * quo    - ��äȤ����Τ˶ᤤ��
      * divmod - �����Ⱦ�;

=== NoMethodError

: ((<NoMethodError#args|NoMethodError/args>))        [new]

  �ɲ�

=== Object

: ((<Object#initialize_copy|Object/initialize_copy>)) [change]

  �ɲ�

  ���Υ᥽�åɤ� initialize ��Ʊ�͡���ưŪ�� private method �ˤʤ�ޤ���

: ((<Object#instance_variable_get|Object/instance_variable_get>)) [new]
: ((<Object#instance_variable_set|Object/instance_variable_set>)) [new]

  �ɲ�

: ((<Object#object_id|Object/object_id>)) [new]

  �ɲ� (Object#id �ϡ�obsolete)

: ((<Object#singleton_method_removed|Object/singleton_method_removed>)) [new]
: ((<Object#singleton_method_undefined|Object/singleton_method_undefined>)) [new]

  �ɲ�

=== Proc

: ((<Proc#binding|Proc/binding>)) [new]

  �ɲ�

: ((<Proc#to_proc|Proc/to_proc>)) [new]

  �ɲ�

# : ((<Precision>)).included      [new]
# 
#   �ɲ�(((<Module#included|Module>)) �κ����)

=== Process

: ((<Process/Process.initgroups>))  [new]
  �ɲ�

: ((<Process/Process.groups>)) [new]
: ((<Process/Process.groups=>)) [new]
: ((<Process/Process.maxgroups>)) [new]
: ((<Process/Process.maxgroups=>)) [new]

  �ɲ�
: ((<Process/Process.detach>)) [new]

  �ɲ�

: ((<Process/Process.abort>)) [new]
: ((<Process/Process.exit>)) [new]

  �ɲá��ؿ� abort, exit ��Ʊ����

: ((<Process/Process.waitall>))         [new]
  �ɲ�

: ((<Process::Status#pid|Process::Status/pid>)) [new]

  �ɲ�

=== Range

: ((<Range#step|Range/step>))     [new]

  �ɲá�step ���Ȥ����ǤǷ����֤��ޤ���

: ((<Range#include?|Range/include?>))          [new]
: ((<Range#member?|Range/member?>))           [new]
  �ɲ�

=== Regexp

: ((<Regexp#to_s|Regexp/to_s>)) [new]

  �ɲá�((<ruby-dev:16909>))

  ����ˤ�ꡢ
      re1 = /hogehoge/i
      re2 = /fugafuga/
      re3 = / #{re1} | #{re2} /x
  �ʤɤ�����ɽ�����֥������Ȥ�����ɽ�����������褦�ˤʤ�ޤ�����

: ((<Regexp#options|Regexp/options>))          [new]
  �ɲ�

=== Socket

: ((<Socket/Socket.pack_sockaddr_in>))          [new]
: ((<Socket/Socket.unpack_sockaddr_in>))        [new]

  �ɲá������åȥ��ɥ쥹��¤��(INET domain)��pack/unpack��

: ((<Socket/Socket.pack_sockaddr_un>))      [new]
: ((<Socket/Socket.unpack_sockaddr_un>))    [new]

  �ɲá������åȥ��ɥ쥹��¤��(UNIX domain)��pack/unpack��

: ((<UNIXSocket/UNIXSocket.pair>))              [new]
: ((<UNIXSocket/UNIXSocket.socketpair>))        [new]
: ((<UNIXSocket#recv_io|UNIXSocket/recv_io>))   [new]
: ((<UNIXSocket#send_io|UNIXSocket/send_io>))   [new]

  �ɲ�

: ((<UNIXServer#listen|UNIXServer/listen>))     [new]
: ((<TCPServer#listen|TCPServer/listen>))       [new]

  �ɲá�Socket#((<Socket/listen>))��Ʊ����

=== String

: ((<String#match|String/match>))      [new]

  �ɲ� re.match(str) ��Ʊ����

: ((<String#lstrip|String/lstrip>))     [new]
: ((<String#rstrip|String/rstrip>))     [new]
: ((<String#lstrip!|String/lstrip!>))     [new]
: ((<String#rstrip!|String/rstrip!>))     [new]

  �ɲá���ü���뤤�ϱ�ü�ζ������������ޤ���
  rstrip �ϡ���¦�� "\0" ��������ޤ���

: ((<String#casecmp|String/casecmp>))   [new]
: ((<String#eql?|String/eql?>))         [change]

  casecmp �ɲá�����ե��٥åȤ��羮��̵�뤷��ʸ������ӡ�

  eql? �ϡ�((<$=|�Ȥ߹����ѿ�>)) ���ͤ˴ؤ餺��˥���ե��٥åȤ��羮
  ����̤���褦�ˤʤ�ޤ�����

: ((<String#insert|String/insert>)) [new]

  �ɲ�

  (({str[n, 0] = other})) ��Ʊ��(������ self ���֤�)

=== Struct

: ((<Struct/each_pair>)) [new]

  �ɲá�

=== Symbol

: ((<Symbol/Symbol.all_symbols>))      [new]
  �ɲ� ((<ruby-dev:12921>))

=== SystemCallError

: ((<SystemCallError/SystemCallError.===>))     [new]

  �ɲ� (�嵭 ��rescue ���...�� �򻲾ȤΤ���)
  ((<ruby-dev:12670>))

: ((<SystemExit#status|SystemExit/status>))       [new]
  �ɲ�

=== Thread

: ((<Thread#keys|Thread/keys>))     [new]
  �ɲá�Thread��ͭ�ǡ����Υ�����������֤��ޤ���


: ((<Thread#terminate|Thread/terminate>)) [new]

  �ɲá�Thread#kill ��Ʊ����

: ((<Thread#group|Thread/group>)) [new]
  �ɲ�

=== ThreadGroup

: ((<ThreadGroup#enclose|ThreadGroup/enclose>)) [new]
: ((<ThreadGroup#enclosed?|ThreadGroup/enclosed?>)) [new]

  �ɲ� ((<ruby-dev:20655>))

  ThreadGroup �ؤ� Thread �ɲ�/�����(freeze ������)�ػߤ��ޤ���

=== Time

: ((<Time#getgm|Time/getgm>))           [new]
: ((<Time#getlocal|Time/getlocal>))     [new]
: ((<Time#getutc|Time/getutc>))         [new]
: ((<Time#gmt_offset|Time/gmt_offset>)) [new]
: ((<Time#gmtoff|Time/gmtoff>))         [new]
: ((<Time#utc_offset|Time/utc_offset>)) [new]

  �ɲ�

=== ����¾

: ((<Array#values_at|Array/values_at>)) [new]
: ((<Hash#values_at|Hash/values_at>)) [new]
: ((<ENV/ENV.values_at>)) [new]
: ((<MatchData#values_at|MatchData/values_at>)) [new]
: ((<aStruct#values_at|Struct/values_at>)) [new]

  ruby 1.6 �� ((<indexes|Array/indexes>)) �ϡ�values_at �Ȥ����᥽�å�
  ̾�ˤʤ�ޤ���(ruby 1.7 �Ǥ� block �ʤ� ((<select|Array/select>)) ��
  indexes ������Ǥ����������������Ѥ���ȷٹ𤬽Фޤ�)��

: ((<Fixnum#to_sym|Fixnum/to_sym>)) [new]
: ((<String#to_sym|String/to_sym>)) [new]

  �ɲ�(Symbol#intern �Ϥʤ��ʤä�)

== �ɲä��줿���

: ((<Float::DIG|Float/DIG>)) [new]
: ((<Float::EPSILON|Float/EPSILON>)) [new]
: ((<Float::MANT_DIG|Float/MANT_DIG>)) [new]
: ((<Float::MAX|Float/MAX>)) [new]
: ((<Float::MAX_10_EXP|Float/MAX_10_EXP>)) [new]
: ((<Float::MAX_EXP|Float/MAX_EXP>)) [new]
: ((<Float::MIN|Float/MIN>)) [new]
: ((<Float::MIN_10_EXP|Float/MIN_10_EXP>)) [new]
: ((<Float::MIN_EXP|Float/MIN_EXP>)) [new]
: ((<Float::RADIX|Float/RADIX>)) [new]
: ((<Float::ROUNDS|Float/ROUNDS>)) [new]

  �ɲ� ((<ruby-math:0773>))

: ((<Marshal::MAJOR_VERSION|Marshal/MAJOR_VERSION>))          [new]
: ((<Marshal::MINOR_VERSION|Marshal/MINOR_VERSION>))          [new]
  �ɲá�Marshal �����Ϥ������ץե����ޥåȤΥС�������ֹ�Ǥ���
  ((<ruby-dev:14172>))

== ��ĥ���줿���饹���᥽�å�(�ߴ����Τ����ѹ�)

=== �Ȥ߹��ߴؿ�

: ((<�Ȥ߹��ߴؿ�/sprintf>)) [new]

  "%p" ���ɲä���ޤ�����inspect �η�̤����Ѥ���ޤ���((<RCR#69>))

: ((<�Ȥ߹��ߴؿ�/trap>)) [compat]

  ���륷���ʥ���Ф��ơ�SIG_DFL �� SIG_IGN ��������Ƥ��Ƥ�����硢
  ʸ���� "DEFAULT" �� "IGNORE" ���֤��褦�ˤʤ�ޤ���(�����ϡ�nil ����
  ���Ƥ��ޤ���) ((<ruby-talk:67860>))

: ((<�Ȥ߹��ߴؿ�/system>)) [compat]
: ((<�Ȥ߹��ߴؿ�/exec>)) [compat]

  ������������ξ�硢���ΰ���ܤ����ǤΥե������Ķ��ѿ�PATH����
  ��������褦�ˤʤ�ޤ�����

  �ޤ���msdosdjgpp��mswin32��mingw32��bccwin32�Ǥ⡢¾�Υץ�åȥե������
  Ʊ�ͤˡ������Ȥ�������Ϳ����줿���ϥ�������ͳ���ʤ��褦�ˤʤ�ޤ�����
  �����Ͼ�˥�������ͳ���Ƥ��ޤ���(win32��port��2003-01-04���ѹ�)��
  ((<ruby-dev:19107>))

: ((<�Ȥ߹��ߴؿ�/rand>)) [compat]

  ��������Υ��르�ꥺ���
  ((<Mersenne Twister|URL:http://www.math.keio.ac.jp/~matumoto/mt.html>))
  ����Ѥ���褦�ˤʤ�ޤ�����

: ((<�Ȥ߹��ߴؿ�/sprintf>))('%u') [compat]

  sprintf �� '%u' �ǡ��Ǿ�̥ӥåȤη����֤��򤢤�魯 ".."  �ϡ��ղ�
  ����ʤ��褦�ˤʤ�ޤ�����((<ruby-dev:16522>))

: ((<�Ȥ߹��ߴؿ�/abort>)) [compat]

  ��λ��å����������Ǥ���褦�ˤʤ�ޤ�����

=== Array

: ((<Array#first|Array/first>)) [compat]
: ((<Array#last|Array/last>)) [compat]

  ��ά��ǽ�ʰ������ɲ�

: ((<Array#push|Array/push>)) [compat]
: ((<Array#unshift|Array/unshift>)) [compat]
: ((<Array#insert|Array/insert>)) [compat]

  ���������ꤵ��ʤ����ˡ�ArgumentError �㳰��ȯ�����ʤ��ʤ�ޤ�����
  (���⤻���� self ���֤������Ǥ�)

: ((<Array#[]|Array/[]>)) [compat]
: ((<Array#[]=|Array/[]=>)) [compat]

  ����Υ���ǥå����Ȥ��� Symbol ����ꤷ����硢Symbol#to_int ��Ƥ�
  �����㳰 ((<TypeError>)) ��ȯ������褦�ˤʤ�ޤ�����
  ((<ruby-list:37217>))

: ((<Array/Array.new>))         [compat]
: ((<Array#fill|Array/fill>))   [compat]

  �֥��å���ɾ����̤� fill �����ͤȤ��ƻ���Ǥ���褦�ˤʤ�ޤ�������
  ���å����������ɾ�������Τǡ����Τ褦����Ǥ� "val" �����������
  ��ޤ���

: ((<Array/Array.new>))       [compat]

  Array.new �ΰ�����������Ϥ��Ȥ��Υ��ԡ�����������褦�ˤʤ�ޤ�����

: ((<Array#pack|Array/pack>))         [compat]
: ((<String#unpack|String/unpack>))   [compat]

  pack/unpack �Υƥ�ץ졼�Ȥ˥����Ȥ򵭽ҤǤ���褦�ˤʤ�ޤ�����

: ((<Array#pack|Array/pack>))         [new]
: ((<String#unpack|String/unpack>))   [new]

  64 bit �����Υƥ�ץ졼��ʸ�� Q/q ���ɲä���ޤ���(Quad �ΰ�)��
  Q �� unsigned��q �ϡ�signed �Ǥ���

: ((<Array#pack|Array/pack>))      [change]
: ((<String#unpack|String/unpack>))   [change]

    Array#pack, String#unpack �Υƥ�ץ졼��ʸ�� "p", "P" �ϡ�nil ��
    NULL�ݥ��󥿤�����Ѵ���Ԥ��褦�ˤʤ�ޤ���((<ruby-dev:13017>))��

=== Class

: ((<Class#inherited|Class/inherited>)) [change]

  inherited �᥽�åɤϥ��饹������ν���˸ƤӽФ����褦�ˤʤ�ޤ�����
  ((<ruby-bugs-ja:342>))

=== Dir

: ((<Dir/Dir.glob>)) [compat]

  Dir.glob ����2����(�ޥå��ε�ư���ѹ�����ե饰)�����Ǥ���褦�ˤ�
  ��ޤ�����Dir[] �ˤϤ��Υե饰�ϻ���Ǥ��ޤ���

  ��Ϣ������� File::FNM_DOTMATCH (FNM_PERIOD �εդΰ�̣)���ɲä����
  ���ޤ���

: ((<Dir/Dir.chdir>))       [compat]
  �֥��å������Ǥ���褦�ˤʤ�ޤ�����

=== ENV

: ((<ENV>)) [change]

  ENV ����������ʸ����Ϥ��٤� ((<Object/freeze>)) �����褦�ˤʤ�ޤ�����
  ((<ruby-talk:72732>))

        ENV['environ'] = 'value'
        ENV['environ'].sub!(/value/, 'VALUE')
        p ENV['environ']

        => ruby 1.6.8 (2002-12-24) [i586-linux]
           "value"

  ������Τ褦�� sub! �Τ褦���˲�Ū�᥽�åɤθ��̤��ʤ����Ắ�𤹤��
  �����Τ���ͳ�Ǥ�(ENV���֤�ʸ������ѹ����Ƥ�Ķ��ѿ����Τ˱ƶ����ʤ�)��

        => -:2:in `sub!': can't modify frozen string (TypeError)
                from -:2
           ruby 1.8.0 (2003-06-09) [i586-linux]

=== Hash

: ((<Hash#update|Hash/update>)) [compat]

  �֥��å������Ǥ���褦�ˤʤ�ޤ�������ʣ�����������Ф��뿶�񤤤���
  ��Ǥ��ޤ���

: ((<Hash/Hash.new>))   [compat]

  �ϥå���Υǥե�����ͤȤ��ƥ֥��å������Ǥ���褦�ˤʤ�
  �ޤ������֥��å�����ꤹ��ȶ��Υϥå������Ǥλ��Ȥ��Ф���
  �������٥֥��å���¹Ԥ������η�̤��֤��ޤ���
  �֥��å��ˤϥϥå��弫�Ȥȡ��ϥå���򻲾Ȥ����Ȥ��Υ������Ϥ���ޤ�

=== IO

: ((<IO/IO.new>)) [compat]

  ((<File/File.open>)) ��Ʊ�ͤ� mode �����(�Ĥޤꡢ
  ((<File::Constants>)) �����) �ǻ���Ǥ���褦�ˤʤ�ޤ�����

: ((<IO#reopen|IO/reopen>)) [compat]

  ����������ά�����Ȥ��쥷���ФΥ⡼�ɤ򤽤Τޤް����Ѥ��褦�ˤʤ��
  �����������ϡ���������Υǥե�����ͤ� "r" ����Ǥ�����

: ((<IO#read|IO/read>)) [compat]
: ((<IO#sysread|IO/sysread>)) [compat]

  IO#read, IO#sysread ����������ɲ�(���餫���������Ƥ��ɤ߹����ѥХ�
  �ե��λ���)

=== Method

: ((<Method#inspect|Method/inspect>))   [compat]

  �ðۥ᥽�åɤ��Ф�����Ϸ���������̣�Τ����Τˤʤ�ޤ�����
  ((<ruby-bugs-ja:PR#193>))

=== Module

: ((<Module#undef_method|Module/undef_method>)) [compat]
: ((<Module#remove_method|Module/remove_method>)) [compat]

  ���٤�ʣ���Υ᥽�åɤ����Ǥ���褦�ˤʤ�ޤ�����((<RCR#146>))

: ((<Module#method_added|Module/method_added>)) [compat]
: ((<Module#singleton_method_added|Module/singleton_method_added>)) [compat]

  ��ĥ�饤�֥�꤫��᥽�åɤ�������줿�Ȥ���ƤФ��褦�ˤʤ�ޤ�����
  ((<ruby-talk:70471>))

: ((<Module/Module.new>))       [compat]
: ((<Class/Class.new>))         [compat]

    Module.new, Class.new �ǥ֥��å���Ϳ����줿��硢��������
    �⥸�塼��/���饹�Υ���ƥ����Ȥǥ֥��å���¹Ԥ���褦��
    �ʤ�ޤ�����

=== Numeric

: ((<Numeric#step|Numeric/step>)) [compat]

  ((<Fixnum>)), ((<Integer>)) �����ư���ޤ�����

=== Object

: ((<Object#singleton_methods|Object/singleton_methods>))         [compat]
  ��ά��ǽ�ʰ��� all ���ɲä���ޤ�����

: ((<Object#methods|Object/methods>)) [compat]
: ((<Object#public_methods|Object/public_methods>)) [compat]
: ((<Object#private_methods|Object/private_methods>)) [compat]
: ((<Object#protected_methods|Object/protected_methods>)) [compat]

  �����ѡ����饹�Υ᥽�åɤ�õ�����뤫�ɤ���������ǻ���Ǥ���褦�ˤ�
  ��ޤ�����((<Module#instance_methods|Module/instance_methods>)) �ʤ�
  ��Ʊ���Ǥ��������Ȥθߴ����Τ�������Υǥե�����ͤ� Module �Τ��
  �ȤϵդǤ���(Module#instance_methods �ʤɤΥǥե�����ͤϾ���(1.8.1)
  �ѹ������ͽ��Τ褦�Ǥ�)

  ((<Object#methods|Object/methods>)) �ϰ����� false �ξ��ˤ��Υ���
  �������Ȥ��ðۥ᥽�åɤΥꥹ�Ȥ��֤��ޤ����Ĥޤꡢ
  ((<Object#singleton_methods(false)|Object/singleton_methods>)) ��Ʊ
  ���Ǥ���

  1.7 ���ѹ�����ޤ�ƻ��ͤ�ޤȤ���

        Object#methods,           Module#instance_methods,
        Object#public_methods,    Module#public_instance_methods,
        Object#private_methods,   Module#private_instance_methods,
        Object#protected_methods, Module#protected_instance_methods
        Object#singleton_methods

  * ������ true �ξ��ϡ��⥸�塼��䥹���ѡ����饹��õ�����롣

  * public_xxx, private_xxx, protected_xxx �Ϥ��줾��public, private,
    protected �᥽�åɤΤߤ��֤���public_, private_, protected_ ���Ĥ�
    �ʤ���methods, instance_methods �ϡ�public �᥽�åɤ� protected
    �᥽�åɤ��֤���

  * Object#methods(false) �� Object#singleton_methods(false) ��Ʊ����

  * ���褳���Υ᥽�åɤΰ����Υǥե�����ͤ� true �ˤʤ�ͽ�������
    Module#xxx_instance_methods �� Object#singleton_methods �ϸ����ǥե�
    ����ͤ� false(���Ȥθߴ��Τ��ᡣ�ʤ�����ά�����ޤޤ��ȷٹ𤬽Ф�)��
    �ǥե���Ȥ����ʤ��褦�ˤ���٤���1.6 �ǻ��Ѥ��Ƥ���������ץȤ�
    �񤭴�������ϡ�false ������Ū�˻��ꤹ�롣

=== Proc

: ((<Proc#to_s|Proc/to_s>)) [compat]

  Proc#to_s �η�̤˥�����ץȤΥ������ե�����̾�ȹ��ֹ椬�ղä���ޤ�
  ����((<ruby-dev:17968>))

=== Regexp

: ((<Regexp#===|Regexp/===>)) [compat]

  �����ͤ��֤��褦�ˤʤ�ޤ�����

: ((<Regexp/Regexp.last_match>))    [compat]
  optional �ʰ������ɲä���ޤ�����

=== String

: ((<String/String.new>))      [compat]

  String.new �ΰ������ά�Ǥ���褦�ˤʤ�ޤ�����

: ((<String/strip>))     [compat]
: ((<String/strip!>))    [compat]
: ((<String/rstrip>))    [compat]
: ((<String/rstrip!>))   [compat]

  ����������Ǥʤ� "\0" �� strip ����褦�ˤʤ�ޤ�����((<ruby-talk:76659>))

: ((<String#scan|String/scan>)) [change]
: ((<String#split|String/split>)) [change]
: ((<String#sub|String/sub>)), ((<String#sub!|String/sub!>)) [change]
: ((<String#gsub|String/gsub>)), ((<String#gsub!|String/gsub!>)) [change]
: ((<String#~|String/~>)) [obsolete]
: ((<String#=~|String/=~>)) [obsolete]
: ((<�Ȥ߹����ѿ�/$;>))   [compat]
: ((<�Ȥ߹����ѿ�/$-F>))  [compat]
: ((<Ruby�ε�ư/-F((*regexp*))>))    [compat]

  pattern �Ȥ�������ɽ���Ǥʤ�ʸ�������ꤷ���Ȥ������������ɽ���˥�
  ��ѥ��뤻��ʸ���󤽤Τ�Τ�ѥ�����Ȥ��ư����褦�ˤʤ�ޤ�����(��
  �����Τˤϡ�Regexp.compile(arg) �Ǥʤ�
  Regexp.compile(Regexp.quote(arg)) ����褦�ˤʤ�ޤ���)

  ((<String#~|String/~>)), ((<String#=~|String/=~>)) �ϡ�obsolete �ˤ�
  ��ޤ�����(String#~ �Ϥ����ˤ������ѹ���ȿ�Ǥ��줿��� obsolete)

#   str =~ arg �����ϡ�arg ��ʸ����ΤȤ���
#   Regexp.compile(Regexp.quote(arg)) =~ str �������� str.index(arg) ��
#   �¹Ԥ���ޤ�(�������äơ�$~ �����ꤵ��ޤ���)��

  $; �λ��������ɽ�����������褦�ˤʤ�ޤ����������ȼ����ʸ�����
  �������ꤷ�Ƥ��㳰 ((<TypeError>)) ��ȯ�����ʤ��褦�ˤʤ�ޤ�����
  ((<ruby-talk:77381>))

: ((<String#center|String/center>)) [compat]
: ((<String#ljust|String/ljust>)) [compat]
: ((<String#rjust|String/rjust>)) [compat]

  ���������˵ͤ����ʸ�������������ǻ���Ǥ���褦�ˤʤ�ޤ�����

: ((<String#[]|String/[]>))     [change]
: ((<String#[]=|String/[]=>))   [change]

  ������������ɽ�����Ϥ������ǡ����ץ������������ idx ���ɲä���ޤ�����
  str[/re/, 0] �ϡ�str[/re/] ��Ʊ���Ǥ���

=== Struct

: ((<Struct>)) [compat]

   Struct ��Ŭ�ڤʥϥå����ͤ���Ĥ褦 Struct#hash, Struct#eql? �����
   ����ޤ�����((<ruby-bugs:PR#758>))

: ((<aStruct#inspect|Struct>)) [compat]

  ���Ϸ��������������Ѥ��ޤ�����

=== Socket

: ((<TCPSocket/TCPSocket.new>))   [compat]
: ((<TCPSocket/TCPSocket.open>))  [compat]
  ��������¦���ɥ쥹���ά��ǽ����3,4�����ǻ���Ǥ���褦�ˤʤ�ޤ�����

=== Thread

: ((<Thread#join|Thread/join>))  [compat]

  ����åɤ��Ԥ���碌����֤� limit �ǻ���Ǥ���褦�ˤʤ�ޤ�����

: ((<Thread/Thread.list>)) [compat]
: ((<ThreadGroup#list|ThreadGroup/list>)) [compat]
  ��λ��(aborting)�Υ���åɤ�ꥹ�Ȥ˴ޤޤ��褦�ˤʤ�ޤ�����
  ((<rubyist:1282>))

=== Time

: ((<Time>))            [compat]
  ��� time_t �򰷤���褦�ˤʤ�ޤ���(OS�����ݡ��Ȥ��Ƥ�����˸¤�)
    p Time.at(-1)
    => Thu Jan 01 08:59:59 JST 1970

=== UnboundMethod

: ((<UnboundMethod#bind|UnboundMethod/bind>)) [compat]

  UnboundMethod ���֥������Ȥ򤽤줬������줿���饹�Υ��֥��饹��
  bind ���Ƥ��ɤ����Ȥˤʤ�ޤ�����

=== ����¾

: ((<NameError/NameError.new>))(msg[, name])            [compat]
: ((<NoMethodError/NoMethodError.new>))(msg, name, args)    [compat]
: ((<SystemCallError/SystemCallError.new>))(msg, err)         [compat]
: ((<Errno::EXXX>)).new(msg)                   [compat]

  �����μ����ǥ��󥹥����ѿ����������Ƥ��ʤ��ä������ warning ��
  �ФƤ����Τ������ޤ����������ơ�new �Υѥ�᡼���Ǥ����ͤ����Ǥ�
  ��褦���ѹ�����ޤ�����

: ((<SystemExit#initialize|SystemExit/SystemExit.new>)) [compat]

  �������ɲä���ޤ�����

: ((<String#to_i|String/to_i>)) [compat]
: ((<Integer#to_s|Integer/to_s>)) [compat]

  �����˴��(2,8,10,16)�����Ǥ���褦�ˤʤ�ޤ�����
  (2002-01-26: ������ 0 �ΤȤ��� prefix �Ǵ����Ƚ�ꤹ��)

  ����Ѵ��ǡ�2, 8, 10, 16 �ʤ����Ǥʤ���2 .. 36�ʿ��ޤǤ�Ǥ�դδ����
  ���Ѵ��򥵥ݡ��Ȥ��ޤ�����((<ruby-dev:20021>))

# �̤˱ƶ��ʤ��ѹ��ʤΤǥ�����
# : ((<Class/Class.inherited>)) [compat]
# 
#   (��: Class#inherited �ǤϤ���ޤ���)
# 
#   �����ϡ����饹�Υ��֥��饹�������ػߤ��뤿����������Ƥ��ޤ�������
#   (((<TypeError>))�㳰��ȯ��������᥽�åɤȤ����������Ƥ��ޤ���) ��
#   ������ Class.new ��ô�ݤ���褦�ˤʤ�ޤ��������Τ��ᡢ
#   Class.inherited �᥽�åɤ�����Ϥʤ��ʤ�ޤ�����
# 
#     class SubClass < Class
#     end
# 
#     #=> -:1:in `inherited': can't make subclass of Class (TypeError)
#                 from -:1
#         ruby 1.7.1 (2001-06-12) [i586-linux]
# 
#     #=> -:1: can't make subclass of Class (TypeError)
#         ruby 1.7.1 (2001-07-31) [i586-linux]

== �ѹ����줿���饹���᥽�å�(�ߴ����Τʤ��ѹ�)

=== �Ȥ߹��ߴؿ�

: ((<�Ȥ߹��ߴؿ�/Integer>))() [change]

  ���ͤ�ʸ����ʳ��Υ��֥������Ȥ��������Ѵ�����Ȥ��� to_i �ǤϤʤ� 
  to_int ����Ѥ���褦�ˤʤ�ޤ�����

: ((<�Ȥ߹��ߴؿ�/Float>))() [change]

  Float() �ϡ������� nil ������դ��ʤ��ʤ�ޤ�����

        p Float(nil)

        => ruby 1.6.7 (2002-03-01) [i586-linux]
           0.0
        => -:1:in `Float': cannot convert nil into Float (TypeError)
                from -:1
           ruby 1.7.3 (2002-09-02) [i586-linux]

=== ARGF

: ((<ARGF#to_s|ARGF/to_s>)) [change]

  ��̤� "ARGF" ����ˤʤ�ޤ������ե�����̾�� ARGF.path �Ǽ������ޤ���

=== ARGV

: ((<�Ȥ߹������/ARGV>)) [change]

  ARGV �γ����Ǥ� freeze �����褦�ˤʤ�ޤ�����

        ruby -v -e 'p ARGV.collect {|v| v.frozen?}' a b c

        => ruby 1.6.8 (2002-12-24) [i586-linux]
           [false, false, false]
        => ruby 1.8.0 (2003-08-11) [i586-linux]
           [true, true, true]

=== Array

: ((<Array#sort!|Array/sort!>))     [change]

  ���self�֤��褦�ˤʤ�ޤ�����

  ����ˤ錄�äƤ��Τ��Ȥ��ݾڤ����櫓�ǤϤʤ������Ǥ� ((<ruby-dev:12506>))��

: ((<Array#reverse!|Array/reverse!>)) [change]

  �������� 1 �ʲ���������Ф��ư����� nil ���֤��Ƥ��ޤ�������self ��
  �֤��褦�ˤʤ�ޤ�����((<String#reverse!|String/reverse!>)) �ε�ư��
  Ʊ���Ǥ���((<ruby-dev:20135>))

: ((<Array#-|Array/->)) [change]

  �������Ȥ��˽�ʣ�����ͤϼ������ʤ��ʤ�ޤ�����

=== Comparable

: ((<Comparable>)) [change]

  obj#<=> �� nil ���֤��褦�ʰ������Ф��ơ�>, >=, <, <= ���㳰
  ((<ArgumentError>)) �򵯤����褦�ˤʤ�ޤ������ޤ���== �ϡ�nil ����
  ���褦�ˤʤ�ޤ�����

: ((<Module/Module#>>)) [change]
: ((<Module/Module#<>)) [change]
: ((<Module/Module#<=>)) [change]

  �Ѿ��ط��ˤʤ����饹Ʊ�Τ���Ӥ� nil ���֤��褦�ˤʤ�ޤ�����
  ((<ruby-dev:20190>))

#   ((<Module/Module#<=>)) �ϡ�1.7 �� nil ���֤��褦���ѹ�����Ƥ��ޤ���
#   �������θ塢-1 �ˡ����θ���� nil �ˤ����ޤ�ޤ�����

: ((<String#<=>|String/<=>>)) [change]
: ((<Comparable>)) [change]

  string <=> other �ϡ�((|other|)) ��ʸ����Ǥʤ���硢
  ((|other|)).to_str �� ((|other|)).<=> ���������Ƥ���� (({0 -
  (other <=> string)})) �η�̤��֤��ޤ��������Ǥʤ���� nil ���֤��ޤ���
  ((<ruby-dev:19625>))

        class Foo
          def to_str
            "foo"
          end
          def <=>(o)
            p "<=> called"
            self.to_str <=> o
          end
        end

        p "foo" <=> Foo.new
        => ruby 1.6.8 (2002-12-24) [i586-linux]
           0
        => ruby 1.8.0 (2003-05-02) [i586-linux]
           "<=> called"
           0

: ((<String#==|String/==>))    [change]
: ((<Numeric#==|Numeric/==>))  [change]

  Comparable ���ѹ��ȹ�碌�� <=> �� nil ���֤��Ȥ� == �� nil ���֤���
  ���ˤʤ�ޤ�����((<ruby-dev:20759>))

=== Dir

: ((<Dir/Dir.open>))        [change]
  �֥��å���ȼ�����((<File>)).open��Ʊ�ͤˡ��֥��å��η�̤��᥽�åɤ�
  ����ͤˤʤ�ޤ�����(1.6������ (({nil})) ����)

: ((<Dir/Dir.glob>))        [change]
  ��Ԥ���Хå�����å���ˤ�ꡢ�磻��ɥ����ɤ򥨥�������
  �Ǥ���褦�ˤʤ�ޤ�����
  �ޤ�����������ü�ʰ�̣�Ϥʤ��ʤ�ޤ���('\0'�θ��̤ϻĤäƤ��ޤ�)��

=== Enumerable

: ((<Enumerable#find|Enumerable/find>)) [change]

  ������ʸ��������Ǥ��ʤ��ʤ�ޤ�����

  �ޤ������Ǥ����Ĥ���ʤ��ä����ϡ�ifnone �η�̤��֤��褦�ˤʤ�ޤ�����

=== File

: ((<File/File.basename>)) [CHANGE]
: ((<File/File.dirname>)) [CHANGE]

  File.dirname �� File.basename ��ư� ((<SUSv3|URL:http://www.unix-systems.org/version3/online.html>)) �˽����褦�ˤʤ�ޤ�����

  ((<ruby-dev:19548>)) [PATCH] file.c for ((<ruby-bugs-ja:PR#389>))
  and ((<ruby-bugs-ja:PR#390>))

        p File.dirname("foo/bar/")
        p File.dirname("foo//bar")
        => ruby 1.6.8 (2002-12-24) [i586-linux]
           "foo/bar"
           "foo/"
        => ruby 1.8.0 (2003-05-02) [i586-linux]
           "foo"
           "foo"

        p File.basename("foo/bar/")
        p File.basename("foo//bar")
        ruby 1.6.7 (2002-03-19) [i386-linux]
        ""
        "bar"
        ruby 1.8.1 (2003-12-27) [i686-linux]
        "bar"
        "bar"

=== Float

: ((<Float#to_s|Float/to_s>)) [change]

  ��������٤򼨤�����Υե����ޥåȤ� "%.10g" ���� "%.16g" ���Ѥ���
  ������(2003-03-20: ���θ塢"%.15g" �ˤʤ�ޤ��� ((<ruby-bugs-ja:PR#406>)))

=== Module

: ((<Module#include|Module/include>)) [change]

  �ȥåץ�٥�� include �ϡ���������� true ����ꤷ�� load �ǥ�����
  ����륹����ץȤΤ�ȤǤϥ⥸�塼��ε�ǽ�� self �� 
  ((<Object/extend>)) ����褦���ѹ�����ޤ�����

: ((<Module#include|Module/include>)) [change], [experimental]

  wrapper �⥸�塼���ɾ������� file (load(file, true)) ��ǡ��ȥå�
  ��٥�� include ��Ԥä��Ȥ���Module �� include �����оݤ� Object ��
  �ʤ���wrapper �⥸�塼��ˤʤ�ޤ�����
  �Ĥޤꡢload(file, true) �ǡ�file ������ɤ����Ȥ��� file ���
  include ��¹Ԥ��Ƥ��Ƥ�ƤӽФ����˱ƶ����ʤ��ʤ�ޤ�����

  ((*����ϼ¸�Ū���ѹ��Ǥ�*))

: ((<Module#include|Module/include>)) [change]
: ((<Object#extend|Object/extend>))  [change]

  ʣ���Υ⥸�塼����Ϥ����Ȥ��˥��󥯥롼�ɤ���������ѹ�����ޤ�����
  ((<ruby-dev:16035>))
  extend ��Ʊ�ͤ������Ǥ���((<ruby-dev:16183>))

  ��İ�� include �������Ȥϵս�ˤʤ�ޤ���

=== Object

: ((<Object#clone|Object/clone>)) [change]

  Numeric �ʤ� immutable �ʥ��֥������Ȥ� clone �Ǥ��ʤ��ʤ�ޤ�����
  ((<ruby-bugs-ja:PR#94>)), ((<rubyist:0831>))

=== Range

: ((<Range#max|Range/max>)) [change]
: ((<Range#min|Range/min>)) [change]
: ((<Range#include?|Range/include?>)) [change]
: ((<Range#member?|Range/member?>)) [change]

  Range#max, Range#min, Range#include? �� <=> �᥽�åɤˤ���ϰϱ黻��
  ������褦�ˤʤ�ޤ�����((<ruby-list:35253>)), ((<ruby-dev:17228>))
  (2003-03-18: min, max �ϸ������ޤ�����((<ruby-dev:19837>)))

  Range#member? �� each �����Ѥ��������Ǥ򻲾Ȥ����ºݤ˥��Ф�¸�ߤ��뤫
  ��ǧ���ޤ���(Enumerable#member? ��Ʊ��)

  1.6 �ޤǤϡ�max, min, member? include? �ϡ�Enumerable �Υ᥽�åɤǡ�
  === �ϡ�Range �Υ᥽�åɤǤ���1.7 �Ǥϡ�max, min, member?, include?,
  === �Ϥ��٤� Range �Υ᥽�åɤǡ�include? �� === ����̾�ˤʤäƤ���
  ����(1.8 �Ǥϡ�max, min �ϡ�Enumerable �Υ᥽�åɤ���äƤ��ޤ�)

: ((<Range#each|Range/each>)) [change]

  Range#each �ϳ����Ǥ� succ �᥽�åɤ���Ѥ��ƥ��ƥ졼����󤹤�褦
  �ˤʤ�ޤ�����

=== Regexp

: ((<Regexp/Regexp.new>)) [change]

  ������������ɽ����Ϳ�������˰����Υ��ץ�����̵�뤷�����Υ��ץ���
  ����ݻ�����ʣ�����֤��褦�ˤʤ�ޤ�����

        p Regexp.new(//is, Regexp::EXTENDED, "e")

        => ruby 1.6.8 (2003-08-03) [i586-linux]
           //xe
        => -:1: warning: flags and encoding ignored
           ruby 1.8.0 (2003-02-16) [i586-linux]
           //is

=== String

: ((<String#chomp|String/chomp>))       [change]
: ((<String#chomp!|String/chomp!>))     [change]
: ((<�Ȥ߹��ߴؿ�/chomp>))              [change]
: ((<�Ȥ߹��ߴؿ�/chomp!>))             [change]

  $/ �� "\n" (�ǥե����)�ΤȤ����ɤι�������("\r\n", "\r",
  "\n" �Τ�����Ǥ�)�Ǥ⤽����������褦�ˤʤ�ޤ�����

=== ThreadGroup

: ((<ThreadGroup#freeze|ThreadGroup/freeze>)) [change]

  freeze ���줿 ThreadGroup �� Thread ���ɲ�/����Ǥ��ʤ��ʤ�ޤ�����

=== Time

: ((<Process/Process.times>))           [change]
  ((<Time/Time.times>)) �����ư���ޤ�����
  (Time.times ��ĤäƤ��ޤ�����warning���Фޤ�)

: ((<Time#to_a|Time/to_a>))       [change]
: ((<Time#zone|Time/zone>))       [change]
  gmtime �ʥ����ॾ������Ф���"UTC"���֤��褦�ˤʤ�ޤ���
  (�����ϴĶ���¸������ξ��"GMT")

== ʸˡ���ѹ�

: parser [compat]

  �����ǻϤޤ륰�����Х��ѿ����ü��ѿ� $1, $2, ... �ʳ��˵�����ʤ���
  ��ޤ�����

: [parser], [change]

  `*' �ˤ������Ÿ������¿�������α��դǹԤ�줿��硢to_ary �����Ǥ�
  ����to_a ������Ÿ���Τ�������󲽤����Ѥ����褦�ˤʤ�ޤ���(��������
  Object#to_a ���оݳ���Object#to_a �Ͼ����������ͽ��Ǥ�)��

: [parser]

  �������ױ黻�� `::' ��ȼ���������������褦�ˤʤ�ޤ�����
        p Object::Foo = 1
  �ޤ���"class Foo::Bar; end" �Ȥ���������ǽ�ˤʤ�ޤ�����

: [parser]

  (({.<digit>}))��Float�Υ�ƥ��ǤϤʤ��ʤ�ޤ�����

: [parser] [experimental]

  �¸�Ū�ʽ����Τ褦�Ǥ���

      a = 1
      p a / 5
        => ruby 1.6.8 (2002-12-24) [i586-linux]
           0
        => ruby 1.8.0 (2003-03-12) [i586-linux]
           0

      a = 1
      p a /5
        => -:2: warning: ambiguous first argument; make sure
           -:2: unterminated regexp meets end of file
           ruby 1.6.8 (2002-12-24) [i586-linux]
        => ruby 1.8.0 (2003-03-12) [i586-linux]
           0

: [parser] [new]

  ����ܥ�γ�ĥɽ��ˡ�����Ѥ���ޤ�����((<ruby-dev:18537>))

        p :"foo#{"bar"}"
        p :'foo#{"bar"}'
        p %s{foo#{"bar"}}

        => ruby 1.7.3 (2002-11-14) [i586-linux]
           :foobar
           :"foo\#{\"bar\"}"
           :"foo\#{\"bar\"}"

: rescue������ [parser] [change]

  rescue ��������ͥ���٤��Ѥ��ޤ���������ϡ��¸�Ū�ʤ�ΤΤ褦�Ǥ���
  (1.8 ��꡼���ǻĤäƤ���Τ��������ѤΤ褦�Ǥ�)

        a = b rescue c

  �ϡ�

        (a = b) rescue c

  �Ǥʤ�

        a = (b rescue c)

  ��ɾ������ޤ���

: [parser] [compat]

  �᥽�å�����γ��Ǥ� return �θƤӽФ��ϥ���ѥ�����Ǥʤ��¹Ի���
  ���顼�ˤʤ�褦�ˤʤ�ޤ�����

        p :doing
        return
        => -:2: return appeared outside of method
           ruby 1.6.7 (2002-03-01) [i586-linux]
        => ruby 1.7.3 (2002-10-04) [i586-linux]
           :doing
           -:2: unexpected return

: [parser] [compat]

  �ͥ��Ȥ����᥽�å�������������褦�ˤʤ�ޤ�����

  �᥽�å������Ǥ� alias, undef ����Ĥ���ޤ�����

  �᥽�å�����γ��Ǥ� super �θƤӽФ��ϥ���ѥ�����Ǥʤ��¹Ի���
  ���顼�ˤʤ�褦�ˤʤ�ޤ�����

  �����餯��((<ruby-dev:16969>)) �����꤬�ѹ�����ͳ�ʤΤǤϤʤ����Ȼ�
  ���ޤ���((<ruby-dev:17882>))

: ((<%W()|��ƥ��/%��ˡ>)) [parser]

  %W(...) �����ƥ�뤬�ɲä���ޤ�����%w() �Ȱۤʤ�Хå�����å���
  ��ˡ�估Ÿ����ͭ���Ǥ���((<ruby-dev:15988>))

: ((<��ƥ��/��Ÿ��>)) [parser]

  #{ ... } �μ�Ÿ�����ʸ����Υǥ�ߥ���ޤ��Ǥ�դ� ruby �ץ������
  �򤽤Τޤ޽񤱤�褦�ˤʤ�ޤ�����������Ʊ���Ǥ����������롼�뤬��
  �ΤˤʤäƤ���褦�Ǥ����Ĥޤꡢ��Ÿ������⳰��Ʊ����§�ǡ�ruby ��
  �������ϥѡ�������ޤ���((<ruby-dev:17422>))

: [parser] [compat]

  ʸ�����ƥ����ι�Ƭ�� __END__ �ϡ�������ץȤν���Ȥߤʤ��ʤ���
  ��ޤ�����((<ruby-dev:17513>))

        # p "
        #__END__
        #"
        p eval(%Q(p "\n__END__\n"))

: ((<?<whitespace>|��ƥ��/���ͥ�ƥ��>)) [parser] [change]

  ?���ڡ�����?���ԡ�?TAB ���ϥ�ƥ��Ȥ���̵���ˤʤ�ޤ�����ɬ�פʤ� 
  ?\s, ?\n, ?\t ������Ѥ��Ƥ���������(�ʲ���������Ԥ����֥륯������
  ����Ѥ��Ƥ��뤳�Ȥ�����) ((<ruby-bugs-ja:PR#261>)), ((<ruby-dev:17446>))

: [parser] [change]
: ((<String#to_f|String/to_f>)) [change]
: ((<�Ȥ߹��ߴؿ�/Float>))() [change]

  ʸ�������ư�����������Ѵ��������������ǡ��饤�֥��ؿ� strtod(3) 
  �˰�¸���ʤ��ʤ�ޤ��������������饤�֥����ȼ���ĥ�ˤ��ư���
  ��뤳�ȤϤʤ��ʤ�ޤ�����

: �᥽�åɸƤӽФ�      [parser] [change]

  �᥽�å�̾�ȳ�̤δ֤˶��򤬤���Ȥ��γ�̤ϰ��������̤ǤϤʤ�
  ���γ�̤Ȳ�᤹��褦�ˤʤ�ޤ�����
  (��������p (1, 2) �Ȥ���ȶ��򤬤��äƤ���������̤ˤʤ롣
  �Ĥޤꡢ(�����餯)�տ��̤��ư���)

    p (1+2)*3

: ��Ｐ�������ɽ����ƥ��    [parser] [change]

  ��Ｐ�������ɽ����ƥ��Ϸٹ𤬽Ф�褦�ˤʤ�ޤ�����

  $_ �Ȥ�����ɽ���ޥå��ϡ�����Ū�� ~/re/ (ñ��� ((<Regexp/~>)) �᥽��
  ��)�ʤɤȤ��뤳�Ȥ��侩����ޤ���

== ����ɽ��

: ((<����ɽ��>)) [regexp]

  ����ɽ�� $ �����Ԥ��������Ǥʤ������ʸ����������ˤ�ޥå�����褦
  �ˤʤ�ޤ���������ϡ�perl �� python ��Ʊ����ư�Ǥ���((<ruby-dev:20104>))

: ((<����ɽ��>)) [regexp]

  ((<ruby 1.8 feature/2003-05-01>)) �� $ ���ѹ���Ʊ�ͤˡ�����ɽ�� \Z
  �����Ԥ��������Ǥʤ������ʸ����������ˤ�ޥå�����褦�ˤʤ�ޤ�����
  ����ϡ�perl �� python ��Ʊ����ư�Ǥ���((<ruby-dev:20187>))

: ((<����ɽ��>)) [regexp]

  ʸ�����饹 [] ��� [, ], - �򥨥������פʤ��ǻ��Ѥ���� warning ����
  ��褦�ˤʤ�ޤ�����((<ruby-dev:19868>))

== Marshal

: ((<Marshal/Marshal.dump>)) [marshal] [change]

4.7->4.8
: ((<Marshal>))         [marshal] [change]
  ̵̾�⥸�塼��� include �������֥������Ȥ�����פǤ��ʤ��ʤ�ޤ�����
  ((<ruby-dev:18186>))

  ̾���դ��⥸�塼��� include �������֥������Ȥϥ���פǤ���include 
  �����⥸�塼��ξ�������ץե����ޥåȤ��ݻ�����褦�ˤʤ�ޤ�����

  ̾���դ��⥸�塼��� include �������֥������Ȥϥ���פǤ���include
  �����⥸�塼��ξ�������ץե����ޥåȤ��ݻ�����褦�ˤʤ�ޤ�����

4.6->4.7
: ((<Marshal>))         [marshal] [change]

  Float �Υ���פ���sprintf(3) �˰�¸���ʤ��ʤ�ޤ������ե����ޥ�
  �ȥС������ 4.6 ���� 4.7 �˾夬�äƤ��ޤ���
  (���θ塢strtod(3) ���Ȥ߹��ߤˤ�ꡢ�ɤ߹��߻��⥷���ƥ�� strtod(3)
  �˰�¸���ʤ��ʤäƤ��ޤ�)

: ((<Marshal>))       [bug]

  ��¤�Υ��饹�Υ��֥��饹�����פ�����Τ������ɤǤ��ޤ���Ǥ�����
  ((<ruby-bugs-ja:PR#104>))

        S = Struct.new("S", :a)
        class C < S
        end
        p Marshal.load(Marshal.dump(C.new))

        => -:4: warning: instance variable __member__ not initialized
           -:4:in `dump': uninitialized struct (TypeError)
                from -:4
           ruby 1.6.5 (2001-09-19) [i586-linux]

        => ruby 1.7.1 (2001-10-19) [i586-linux]
           #<C a=nil>

== Windows �б�

: ((<File/File.link>)) [new]

  Win32(Win2k�ʹߤΤ�)��NTFS��ǤΥϡ��ɥ�󥯤κ���(CreateHardLink)��
  �б����ޤ�����

: ((<File/File.utime>)) [new]

  Win32(NT�ϤΤ�)�ǥǥ��쥯�ȥ���Ф���utime�������褦�ˤʤ�ޤ�����

* DOSISH�ʥץ�åȥե�����ǤΥɥ饤�֥쥿���б�����������ޤ�����
* ((<Process/Process.pid>)) (win)

  ((<mswin32>))�� ruby �� ((<MinGW>))�� ruby �ǳ�ĥ�饤�֥��ΥХ���
  ��ߴ����ݤĤ褦�ˤʤ�ޤ�����Config::CONFIG['RUBY_SO_NAME'] ��
  msvcrt-ruby((|XX|)) ��(DLL ̾�ˤʤ�ޤ�)��Config::CONFIG['sitearch'] (��ĥ
  �饤�֥����֤����Υѥ�����)�� "i386-msvcrt" ���ѹ�����ޤ�����
  ((<ruby-dev:17144>)), ((<ruby-dev:18047>))

  Win32�Ѥ��������ѥ��ץ��ݡ��ȤΥѥå��������ޤ줿�Τ������Ǥ�
  ((<ruby-win32:185>))

: ((<Process/Process.kill>)) [compat]

  ChangeLog �ˤ��� win32 �Ǥ⡢�����ʥ� 0 �����ݡ��Ȥ��줿�����Ǥ���
  ¿���� Unix �ǡ������ʥ� 0 �������ϡ��ץ�������¸�ߥ����å��˻��Ѥ�
  ���ޤ��Τǡ������Ʊ��ư��򤹤�Τ��Ȼפ��ޤ���

: ruby interpreter (win32, MinGW) [ruby] [change]

  ((<mswin32>))�� ruby �� ((<MinGW>))�� ruby �ǳ�ĥ�饤�֥��ΥХ���
  ��ߴ����ݤĤ褦�ˤʤ�ޤ�����Config::CONFIG['RUBY_SO_NAME'] �� 
  msvcrt-ruby((|XX|)) ��(DLL ̾�ˤʤ�ޤ�)��Config::CONFIG['sitearch'] (��ĥ
  �饤�֥����֤����Υѥ�����)�� "i386-msvcrt" ���ѹ�����ޤ�����
  ((<ruby-dev:17144>)), ((<ruby-dev:18047>))

  sitearch �ϡ�����η�ǿ����ɲä���ޤ���(¾�δĶ��Ǥ� 
  CONFIG['arch'] ��Ʊ��)

  ((<Win32�ͥ��ƥ�����>)) �ε����⻲��

: ENV["PATH"]    [ruby], [bug?]

  Windows �ʤɤΥץ�åȥե�����ǴĶ��ѿ�̾ PATH (�������ƥ�������
  �����ʤɤ�Ƚ��)����ʸ���Ⱦ�ʸ������̤��ʤ��褦�ˤʤ�ޤ�����
  ((<ruby-dev:20374>))

: �������ѥ��� (win) [compat]

  Win32�Ѥ��������ѥ��ץ��ݡ��ȤΥѥå��������ޤ줿�Τ������Ǥ� 
  ((<ruby-win32:185>))

: ((<Process/Process.kill>))    [compat]

  ((<mswin32>)), ((<mingw32>)) �Ǥ⡢Process.kill(9, pid) �ǥץ�������
  ������λ(TerminateProcess) �Ǥ��ޤ���(Process.kill("KILL", pid) �Ȥ�
  �Ǥ��ʤ��褦�Ǥ�������2002-08-28 ���θ� "KILL" �ǻ���Ǥ���褦�ˤʤ�
  ���褦�Ǥ�)

: win32: map OS error to errno. [change]

: cygwin

  cygwin�ǤϾ�˥Х��ʥ�⡼�ɤˤʤ�ޤ���(((<ruby-dev:19583>)))

: ((<File/File.dirname>)) [CHANGE]
: ((<File/File.expand_path>)) [CHANGE]
: ((<File/File.join>)) [CHANGE]

  DOSISH�ʥץ�åȥե�����ǤΥɥ饤�֥쥿���б�����������ޤ�����
  ((<DOSISH �б�>))�򻲾ȡ�

: ((<Process/Process.pid>)) (win) [change]

  mswin32 �Ǥ� mingw32 �Ǥǡ�ruby �����ϥץ�����ID���������ͤ��Ѵ�����
  �����褦�ˤʤ�ޤ�����
  NT�Ϥ�OS�ǤϽ���Ȱ㤤�Ϥ���ޤ��󤬡�Win9x�Ϥ�OS�Ǥϡ�OS���ݻ�����
  �ץ�����ID�����ͤʤΤǡ�����Ѵ����ư����褦�ˤʤ�ޤ���((<ruby-dev:18263>))

== �ѻߤ��줿(�����ͽ���)��ǽ

: ((<�Ȥ߹����ѿ�/$defout>)) [obsolete]
: ((<�Ȥ߹����ѿ�/$deferr>)) [obsolete]

  $stdout, $stderr ����Ѥ��Ƥ���������

: ((<String#=~|String/=~>)) [obsolete]
: ((<String#~|String/~>))  [obsolete]
  string =~ string ���Ф��Ʒٹ𤬽Ф�褦�ˤʤ�ޤ���������Ū�� string
  =~ regexp ���뤤�� regexp =~ string ��Ȥ����Ȥ��侩����ޤ���
  (1.8.1 �ʹ߻��ѤǤ��ʤ��ʤ뤫�⤷��ޤ���) ((<ruby-list:37662>))

  String#=~ ���ѹ���Ʊ�ͤ�String#~ �Ƿٹ𤬽Ф�褦�ˤʤ�ޤ�����
  (1.8.1 �ʹ߻��ѤǤ��ʤ��ʤ뤫�⤷��ޤ���)

: ((<Object#id|Object/id>))
: ((<Object#type|Object/type>)) [obsolete]

  �Ȥ��ȷٹ𤬽Ф�褦�ˤʤ�ޤ���������� Object#object_id,
  Object#class ����Ѥ��Ƥ���������

: ((<Object#to_a|Object/to_a>)) [obsolete]

  �ٹ��å��������Ф�褦�ˤʤ�ޤ�����(((<obsolete>)) �ˤʤ�Τ������Ǥ�)

: ((<Range#size|Range/size>))     [obsolete]
: ((<Range#length|Range/length>)) [obsolete]

  ���Υ᥽�åɤϤʤ��ʤ�ޤ�����
  ((<ruby-talk:64479>)), ((<ruby-talk:72133>))

  Range �����ǿ�������ˤ�

        p(("a".."z").to_a.size)

  �ʤɤȤ���ɬ�פ�����ޤ���

: ((<Array/indexes>))
: ((<Array/indicies>))

  (((<Array>)), ((<Hash>)), ((<ENV>))) �Υ᥽�åɡ�indexes, indicies 
  �� values_at �Ȥ���̾�����Ѥ��ޤ�����

: ((<Array#filter|Array/filter>))

  �ʤ��ʤ�ޤ�����

: Time.times

  ((<Process/Process.times>)) �˰�ư���ޤ�����

: NotImplementError             [obsolete]

  ��ΤϺ������ޤ�����((<NotImplementedError>))��ȤäƤ�������

: ((<Proc#yield|Proc/yield>))

  �ʤ��ʤ�ޤ�����((<ruby-dev:20180>))

== �饤�֥��

: ((<tmpdir>)) [new]

  �ƥ�ݥ��ǥ��쥯�ȥ��������뤿��Υ饤�֥�꤬�ɲä���ޤ�����
  Windows �ʤɤ����Ѥ����饤�֥��ϡ�/tmp ��ϡ��ɥ����ɤ�����(��
  �� �Ķ��ѿ� TEMP �ʤɤ򻲾Ȥ�����)���Υ饤�֥�����Ѥ���٤��Ǥ���
  (tempfile �ʤɤ� tmpdir ����Ѥ���褦�ˤʤ�ޤ�����
  ((*tmp*))dir �� ((*temp*))file �Ȥ����Τ��ޤ��ʤ�Ȥ⡦����)


: ((<Timeout/Timeout.timeout>)) [lib] [new]
: ((<Timeout::Error|Timeout/Error>)) [lib] [new]

  timeout �� Timeout �⥸�塼�뤬�������ޤ�����((<RCR#121>))

  �ؿ� ((<timeout/timeout>)) �ϡ��⥸�塼��ؿ� Timeout.timeout ����̾�ˡ�
  �㳰 ((<TimeoutError>)) �� Timout::Error ����̾�ˤʤ�ޤ�����

: ((<erb>))           [lib] [new]

  �ɲ�

: ((<"io/wait">))     [lib] [new]

  �ɲ�

: ((<mkmf>)) [lib] [new]

  ������Ƚ��᥽�å� have_type(), check_sizeof() ���ɲä���ޤ�����

: ((<pathname>))        [lib] [new]

  �ɲ�

: ((<resolv>))       [lib] [compat]

  Win32 ���б����ޤ�����

: ((<webrick>))      [lib] [new]

  �ɲ�

: ((<openssl>))      [lib] [new]

  �ɲ�

: ((<win32ole|WIN32OLE>)) [lib] [new]

  �ɲ�

: ((<un>)) [lib] [new]

  �ɲ�

: ((<csv>)) [lib], [new]

  �ɲá�

: ((<tk|tk>)) [lib], [change]

  Ruby/Tk ��¿���ν���������ޤ�����((<ruby-list:37798>))

: ((<drb>)) [lib] [new]

  dRuby �ɲá�((<ruby-dev:20363>))

: ((<rexml>)) [lib],[new]

  �ɲ�

: ((<yaml|YAML>)) [new]

  �ɲá�YAML �ϡ�YAML Ain't Markup Language �������Ǥ���
  ((<URL:http://yaml4r.sourceforge.net/>))
  ((<URL:http://yaml.org/>))

: ((<zlib>)) [lib] [new]

  �ɲ�

: ((<bigdecimal>)) [lib] [new]

  �ɲ�

: ((<"test/unit"|Test::Unit>)) [new]

  Test::Unit �ɲ�

: ((<"win32/registry">)) [new]
  Win32�ǥ쥸���ȥ�˥����������뤿��Υ饤�֥�꤬�ɲä���ޤ�����

: ((<profiler>)) [lib] [new]

  �ɲá�((<profile>)) �μ��ΤȤ���ʬΥ����ޤ�����

: ((<open-uri>)) [lib] [new]

  �ɲ�

: ((<set>)) [lib] [new]

  �ɲ�

: ((<"net/ftp">)) [new]

  �᥽�å� set_socket �ɲ�

: ((<dl>)) [lib] [new]

  �ɲ�

: ź�ե饤�֥�� [lib] [new]

  �ʲ��Υ饤�֥�꤬�������ɲä���ޤ�����
  ((<iconv>)), ((<tsort>)), ((<StringIO>)), ((<strscan>)),
  ((<fileutils>)), racc/*

: ((<benchmark>)) [new]
  added

: Curses        [lib] [compat]

  Updated.  New methods and constants for using the mouse, character
  attributes, colors and key codes have been added.

: Complex#to_i          [lib] [obsolete]
: Complex#to_f          [lib] [obsolete]
: Complex#to_r          [lib] [obsolete]

  Complex#to_i, #to_f, #to_r �Ϥʤ��ʤ�ޤ�����
  ((<ruby-bugs-ja:PR#102>)), ((<rubyist:0879>))

: ((<gdbm>))    [lib] [change]
: ((<dbm>))     [lib] [change]
: ((<sdbm>))    [lib] [change]

  ((*�ɥ������̤ȿ��*))
  ((<ruby-dev:16126>))

: ((<mkmf>)), extmk [lib] [compat]

  extmk �� mkmf ��ޡ��������Ȥ����Ϥ���ޤ�����extmk �� 
  mkmf �����Ѥ���褦�ˤʤ�ޤ�����mkmf �⤳���ȼ���ѹ����Ԥ��
  �Ƥ��ޤ���((<ruby-dev:18109>))

: ((<"net/ftp">)) [compat]

  getbinaryfile() ���������(��������ե�����̾)����ά��ǽ�ˤʤ�ޤ�����
  �᥽�å� get(), put(), binary(), binary = �ɲ�

: ((<"net/http">)) [compat]
  Net::HTTP �Υ��饹�᥽�åɤ� ((<URI>)) ���֥������Ȥ��Ȥ���褦�ˤʤä���

      Net::HTTP.get_print(URI.parse('http://www.ruby-lang.org/ja/'))

  ���󥹥��󥹥᥽�åɤǤϻȤ��ʤ��Τ����ա�

: ((<readline>))                [change]

  Readline.readline �¹���� Ctrl-C �ˤ�����Ǥ�����Ǥ⡢ü�����֤�
  ��������褦�ˤ��ޤ�����((<ruby-dev:14574>))

== ��ĥ�饤�֥��API
: rb_define_alloc_func() [api] [new]
: rb_undef_alloc_func() [api] [new]

  �ɲá�((<Class/allocate>)) �᥽�åɤ�����˻��Ѥ��ޤ���
  ((<ruby-dev:19116>))

: rb_enable_super() [api]
: rb_disable_super() [api]

  ChangeLog �ˤ��ȡ������δؿ���ɬ�פʤ��ʤä��褦�Ǥ���

  (rb_enable_super() ��Ƥ֤� warning ���Фޤ�)�������ϡ���ĥ�饤�֥�
  ��Υ�٥�ǡ�rb_call_super() (Ruby �� super �ˤ�����) ��Ƥ֥᥽��
  �ɤ� rb_enable_super() ���Ƥ����ʤ���Фʤ�ޤ���Ǥ�����

: STR2CSTR() [api] [new]

    ��ĥ�饤�֥��� API �Ǥ��� STR2CSTR() �ϡ�Ϳ����줿���֥�������
    ��ʸ����Ǥʤ����� to_str �᥽�åɤ���ľ�硢������ to_str ��Ƥ�
    �Ф��ư��ۤη��Ѵ���Ԥ��ޤ������ξ�硢�Ѵ���̤��ݻ�����ʸ�����
    ���󥿤��֤��ޤ���������API�Ǥϰ��ۤη��Ѵ���̤Υ��֥������Ȥ���
    ������⻲�Ȥ���ʤ����ᡢ���Ѵ���̤� GC ������ǽ��������ޤ���
    ((<ruby-dev:12731>))

    version 1.7 �ʹߤǤ������ StringValuePtr() ����Ѥ��ޤ���������
    �ϡ������λ����褬���ۤη��Ѵ��η�̤��֤�����뤿���Ѵ���̤� GC 
    ����ޤ���(version 1.7 �Ǥϡ�STR2CSTR() �ϡ�obsolete �Ǥ�)

    �⤦��Ŀ����� StringValue() �Ȥ��� API ���Ѱդ���Ƥ��ޤ���������
    �ϡ������� to_str �ˤ����ۤη��Ѵ�����Ԥ�����˻��Ѥ��ޤ���
    ������ʸ����ʤ鲿�⤷�ޤ���
    ʸ�����������᥽�åɤκǽ�������ɤ�Ǥ����������Ǥ���

    �ʤ������ΤȤ��� str2cstr() (C�ݥ��󥿤�ʸ����Ĺ���֤�)�������
    �ʤ������ API ���Ѱդ���Ƥ��ޤ���(((<ruby-dev:15644>))����Ƥ�
    ����ޤ���)

== �Х�����

: ((<�Ȥ߹��ߴؿ�/load>)) [bug]

  ((<�Ȥ߹��ߴؿ�/load>)) ������åɥ����դˤʤ�ޤ�����((<ruby-dev:20490>))

: ((<�Ȥ߹��ߴؿ�/syscall>)) [bug]

  ��������ʹߤ�ʸ���� Fixnum ���������դ��ʤ�����ˡ�long ���ϰϤ�
  ���ͤ���ꤹ�뤳�Ȥ��Ǥ��ޤ���Ǥ�����((<ruby-talk:72257>))

        syscall(1, 2**30)

        => -:1:in `syscall': wrong argument type Bignum (expected String) (TypeError)
                from -:1
           ruby 1.6.8 (2002-12-24) [i586-linux]


: ((<�Ȥ߹��ߴؿ�/trap>))       [bug]
: ((<�Ȥ߹��ߴؿ�/trace_var>))  [bug]

  ��������˱������줿ʸ������Ϥ����㳰 ((<SecurityError>)) ��
  ������褦�ˤʤ�ޤ�����1.6 �Ǥϡ��������줿ʸ����򥻡��ե�
  �٥�4��ɾ������褦�ˤʤäƤ��ޤ�����
  ((<ruby-list:32215>))

: ((<Array#collect|Array/collect>))   [bug]
: ((<Array#map|Array/map>))       [bug]

  Array#collect ���֥��å���ȼ��ʤ����� self.dup ���֤��Ƥ��ޤ�����
  ���Τ��ᡢArray �ʳ����֤����Ȥ�����ޤ���((<ruby-list:30480>))��

    Foo = Class.new Array

    a = Foo.new
    p a.map.class
    p a.collect.class

    => ruby 1.7.1 (2001-06-12) [i586-linux]
       Array
       Foo

    => ruby 1.7.1 (2001-07-31) [i586-linux]
       Array
       Array

: ((<Bignum>)) [bug]

  -2147483648 ��꾮�������ͤ�2�ʡ�8�ʡ�16�ʤ�ɽ�������������ʤäƤ��ޤ���
  ((<ruby-list:34828>))

    p "%b" % -2147483648
    p "%b" % -2147483649
    p "%b" % -2147483650

    => ruby 1.6.7 (2002-03-01) [i586-linux]
       "..10000000000000000000000000000000"
       "..1"
       "..10"

    => ruby 1.7.2 (2002-04-11) [i586-linux]
       "..10000000000000000000000000000000"
       "..101111111111111111111111111111111"
       "..101111111111111111111111111111110"

: ((<File/File.open>))       [bug]

  ��2���������(File::RDONLY|File::CREAT�Ȥ�)�ǻ��ꤷ�����˸¤ꡢ��3
  �������Ѥ��Ƥ��ޤ���������3������Ϳ������о��ͭ���ˤ���褦��
  ���ޤ�����
  ((<ruby-bugs-ja:PR#54>))

: ((<IO>)) (win32) [bug]

  mswin32��mingw32�ǡ������⡼��(w+,r+)�ǥ����ץ󤵤줿�ե�������Ф���
  �ɤ߽񤭤��ڤ��ؤ������ޤ����äƤ��ʤ��ä����꤬��������ޤ�����
  bccwin32�ˤ�Ʊ�ͤ����꤬����ޤ������������̤�����Ǥ���
  ((<ruby-dev:19299>))

: ((<IO#putc|IO/putc>)) [bug]

  ���ϥ᥽�åɤΤ��� putc ������ write �᥽�åɤ���Ѥ��Ƥ��ޤ���Ǥ�����
  ((<ruby-dev:18038>))

: IO#read, gets ..., etc. [bug]

  File::NONBLOCK ����ꤷ�� IO ���ɤ߹��ߤ� EWOULDBLOCK ��ȯ������ȡ�
  ����ޤ��ɤ���ǡ����������뤳�Ȥ�����ޤ�����
  ((<ruby-dev:17855>))

  Thread ��Ȥä��ץ������ǡ��ե����뤫��ǡ������ɤ߹���ǥ����åȤ�
  �񤭽Ф��Ƥ���ȡ��������� Socket#write �� Errno::EINTR �ˤʤäƤ��ޤ�
  ���Ȥ�����ޤ�����((<ruby-dev:17878>)), ((<ruby-core:00444>))


: ((<Proc>)) [bug]

  $SAFE ����1 or 2 �ΤȤ�
  �������줿 Proc �ϡ��֥��å��ˤǤ��ʤ��ʤ�ޤ��� ((<ruby-dev:15682>))
  ((-���餤 2003-08-06: �Ǥ��Ƥ롦������-))

        $SAFE = 1
        proc = proc {}
        proc.taint
        p proc.tainted?
        def foo(&b)
          p b.tainted?
        end
        foo(&proc)

        => ruby 1.6.8 (2003-08-03) [i586-linux]
           true
           true
        => ruby 1.8.0 (2003-08-04) [i586-linux]
           true
           true

: ((<String#split|String/split>))    [bug]

  ��ʸ������Ф��� split ����ʸ��������Ǥ˻���������֤��Ƥ��ޤ�����

        p "".split(//)
        p "".split(//, 0)
        p "".split(//, 1)
        => ruby 1.6.8 (2002-12-24) [i586-linux]
           []
           []
           [""]
        => ruby 1.8.0 (2003-07-25) [i586-linux]
           []
           []
           []

: ((<String#split|String/split>)) [bug]

  �ʲ�����Τ褦�ˡ��������� ' ' (awk split)����ꤷ�Ƥ��ġ��������
  ����ꤷ�����˺Ǹ�����Ǥ���Ƭ��;ʬ�ʶ��򤬻ĤäƤ��ޤ�����

        p "a  b  c".split(' ',3)
        => ruby 1.6.8 (2002-12-24) [i586-linux]
           ["a", "b", " c"]
        => ruby 1.8.0 (2003-07-03) [i586-linux]
           ["a", "b", "c"]

: ((<String#split|String/split>)) [bug]

  String#split ����2������ -1 �ΤȤ�����ʸ������Ф��ƶ�ʸ��������Ǥ�
  ����������֤��Х�����������ޤ�����((<ruby-bugs-ja:PR#426>))

        p "".split(//)
        p "".split(//, -1)

        => ruby 1.6.8 (2002-12-24) [i586-linux]
           []
           [""]
        => ruby 1.8.0 (2003-04-25) [i586-linux]
           []
           []

: ((<String#rindex|String/rindex>)) [bug]

  ʸ�������� \0 ��ʸ���������˥ޥå����Ƥ��ޤ�����

        p "abc".rindex(0)
        p "abc".index(0)
        => ruby 1.6.8 (2002-12-24) [i586-linux]
           3
           nil
        => ruby 1.8.0 (2003-07-03) [i586-linux]
           nil
           nil

: ((<String#upto|String/upto>)) [bug]

  String#upto ���ϰϥ����å����������ä��Х�����������ޤ�����
  ���ߤϡ�((<String/succ>)) ��ư��Ȱ��פ��ޤ���

        p(('a'..'aa').to_a)
        => ruby 1.6.8 (2002-12-24) [i586-linux]
           ["a"]
        => ruby 1.8.0 (2003-07-03) [i586-linux]
           ["a", "b", "c", ..., "y", "z", "aa"]

        'a'.upto('aa') {|c| p c}
        => ruby 1.6.8 (2002-12-24) [i586-linux]
           "a"
        => ruby 1.8.0 (2003-07-03) [i586-linux]
           "a"
           "b"
           "c"
            :
           "y"
           "z"
           "aa"

  �����μ����Ǥϰʲ��� 'aa' ��ޤޤʤ��Ȥ�

        'a'.upto('b') {|c| p c}
        => ruby 1.6.8 (2002-12-24) [i586-linux]
           "a"
           "b"
        => ruby 1.8.0 (2003-07-03) [i586-linux]
           "a"
           "b"

  �ʲ��η�̤Ƚ���ط������פ��Ƥ��ޤ���Ǥ�����

        p(('a'..'zz').to_a)
        => ruby 1.6.8 (2002-12-24) [i586-linux]
           ["a", "b", "c", ..., "x", "y", "z", "aa", ..., "zx", "zy", "zz"]
        => ruby 1.8.0 (2003-07-03) [i586-linux]
           ["a", "b", "c", ..., "x", "y", "z", "aa", ..., "zx", "zy", "zz"]

  �ʤ���<=> �ν���ϼ����Ǥ��뤳�Ȥ����դ���ɬ�פ�����ޤ���
        p 'a' < 'b'    # => true
        p 'aa' < 'b'   # => true

: ((<Thread#wakeup|Thread/wakeup>)) [bug]
: ((<Thread#run|Thread/run>)) [bug]
  ��λ��(aborting)�Υ���åɤ��Ф��Ƽ¹Ԥ���ȥ���åɤ������֤�
  �Х�����������ޤ�����
  ((<rubyist:1282>))

: [bug]

  ((<ruby-talk:73481>))

        p 'mike stok' =~ /^(?i-mx:mike) (?i-mx:stok)$/
        => ruby 1.6.8 (2002-12-24) [i586-linux]
           nil
        => ruby 1.8.0 (2003-06-16) [i586-linux]
           0

  ((<ruby-talk:73549>))

        p "Mike" =~ /(?-i)[Mm]ike/
        => ruby 1.6.8 (2002-12-24) [i586-linux]
           nil
        => ruby 1.8.0 (2003-06-16) [i586-linux]
           0

: ((<�������ƥ���ǥ�>)), ((<�Ȥ߹����ѿ�/$SAFE>)) [bug], [change]

  ((<��λ����>))ľ���� $SAFE �� 0 �ˤʤ�褦���ѹ�����ޤ�����
  ((<ruby-core:01119>))

        $SAFE = 1
        END { p $SAFE }
        => ruby 1.6.8 (2002-12-24) [i586-linux]
           1
        => ruby 1.8.0 (2003-06-09) [i586-linux]
           0

: ruby interpreter [bug]

  �ʲ��ΥХ�����������ޤ���((<ruby-list:37677>))
  (���ƥ졼������� block ��¾�Υ᥽�åɤ� & ���Ϥ������Τ��Υ᥽�å�
  �ΰ����Υ���ƥ����Ȥΰ�����)

        def foo
          p(block_given?)
          p(block_given?,&proc)
          p(yield,&proc)
        end

        foo { }

        => ruby 1.6.8 (2002-12-24) [i586-linux]
           true
           false
           -:4: [BUG] Segmentation fault
           ruby 1.6.8 (2002-12-24) [i586-linux]

        => ruby 1.6.8 (2003-05-15) [i586-linux]
           true
           false
           -:4:in `foo': no block given (LocalJumpError)
                from -:7

        => ruby 1.8.0 (2003-05-17) [i586-linux]
           true
           true
           nil

: ((<"||="|�黻�Ҽ�>)) [bug]

  ̤������ѿ����Ф��� ||= ���ͤ����������Ȥ��ˡ��������Х��ѿ��Ƿٹ�
  ���ФƤ��ޤ������ޤ������饹�ѿ��ϥ��顼�ˤʤäƤ��ޤ�����
  ((<ruby-dev:18278>))

        local ||= 1
        @instance ||= 1
        $global ||= 1
        @@class ||= 1

        => -:3: warning: global variable `$global' not initialized
           -:4: uninitialized class variable @@class in Object (NameError)
           ruby 1.6.7 (2002-03-01) [i586-linux]
        => ruby 1.7.3 (2002-09-13) [i586-linux]

: large file [bug]

  large file(�������� 4G bytes �ʾ�Υե�����)�������������褦�ˤʤ��
  ����(��)
  ((<ruby-talk:35316>)), ((<ruby-talk:35470>))

: alias         [bug]

  �������Х��ѿ��Υ����ꥢ���������Ƥ��ޤ���Ǥ�����
  ((<ruby-dev:14922>))

        $g2 = 1
        alias $g1 $g2
        p [$g1, $g2]
        $g2 = 2
        p [$g1, $g2]
        => ruby 1.6.5 (2001-09-19) [i586-linux]
           [1, 1]
           [1, 2]

        => ruby 1.7.1 (2001-10-19) [i586-linux]
           [1, 1]
           [2, 2]

=== ���ݡ��ȥץ�åȥե�������ɲ�

: WindowsCE [platform]

  ((<WindowsCE>)) �Υ��ݡ��ȥѥå��������ޤ�ޤ�����

: Borland C++ ���ݡ��� [platform]

  bcc �� ruby ���󥿥ץ꥿�򥳥�ѥ��뤹�뤿��Υѥå����ޡ�������ޤ�
  ����

: ((<VMS>)) support [platform]

  ((<VMS>)) �Υ��ݡ��ȥѥå��������ޤ�ޤ�����