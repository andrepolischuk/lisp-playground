(write-line "Hello world")
(terpri)

(setq x 1)
(defvar y 2)

(defun out (a b)
  (format t "~% ~d: ~d" a b))

(out 'x x)
(out 'y y)

(let
  ((z 3))
  (out 'z z))

(defconstant PI 3.141592)
(out 'PI PI)

(out "not equal" (/= x y))
(out "max" (max x y))
(out "and" (and x y))

(cond
  ((< x y) (out '< (list x '< y)))
  (t (out '> (list x '> y))))

(if (< x y)
  (out '< (list x '< y))
  (out '> (list x '> y)))

(dolist (arg *args*)
  (out 'arg arg))

(defun add (a b &optional c)
  (if c
    (+ a b c)
    (+ a b)))

(out 'add (add x y))
(out 'add (add x y 3))

(defun restparams (a &rest params)
  (list a params))

(defun keyparams (&key a b)
  (list a b))

(out 'rest (restparams "foo"))
(out 'rest (restparams "foo" "bar" "baz"))
(out 'key (keyparams :a 1 :b 2))

(out 'lambda
  ((lambda (a b) (+ a b)) 1 2))

(terpri)

(out 'map
  (mapcar '1+ '(1 2 3)))

(out 'map
  (mapcar '+ '(1 2 3) '(3 2)))

(out 'map
  (mapcar #'(lambda (x) (* x x)) '(1 2 3)))

(terpri)

(out 'list (listp *args*))
(out 'number (numberp y))
(out 'integer (integerp y))
(out 'null (null nil))
(out 'zero (zerop 0))
(out 'string (stringp "foo"))

(terpri)

(out 'type-of (type-of x))
(out 'type-of (type-of y))
(out 'type-of (type-of (/ x y)))
(out 'type-of (type-of PI))
(out 'type-of (type-of t))
(out 'type-of (type-of nil))
(out 'type-of (type-of *args*))
(out 'type-of (type-of 'foo))

(terpri)

(setq ch #\a)
(out 'char ch)
(out 'type-of (type-of ch))
(out 'equal (char= ch #\a))
(out 'equal (char-equal ch #\A))

(terpri)

(setf arr2 (make-array '(2)))
(setf (aref arr2 0) 1)
(setf (aref arr2 1) 2)
(out 'array arr2)
(out 'type-of (type-of arr2))
(out 'length (length arr2))

(terpri)

(setf arr5 (make-array '(5) :initial-contents '(1 2 3 4 5)))

(out 'array arr5)
(out 'type-of (type-of arr5))
(out 'length (length arr5))

(terpri)

(setq str "Foo bar")
(out 'string str)
(out 'type-of (type-of str))
(out 'length (length str))
(out 'equal (string= str "Foo bar"))
(out 'equal (string-equal str "foo bar"))
(out 'uppercase (string-upcase str))
(out 'lowercase (string-downcase str))
(out 'capitalize (string-capitalize str))
(out 'substring (string-trim " " (subseq str 3)))
(out 'char (char str 4))
(out 'reverse (reverse str))
(out 'concat (concatenate 'string str " baz"))

(terpri)

(write-line "Type a text:")
(setq readed (read-line))
(out 'readed readed)

(terpri)

(out 'stdout (type-of *standard-output*))
(out 'stderr (type-of *error-output*))

(format *standard-output* "~% stdout")
(format *error-output* "~% stderr")

(with-open-file
  (stream "./main.log" :if-does-not-exist :create :direction :output :if-exists :append)
  (format stream "Args: ~d" *args*)
  (terpri stream)
  (format stream "Read: ~d" readed)
  (terpri stream))

(terpri)

(setf args2 (make-array (length *args*) :initial-contents *args*))

(if (> (length *args*) 0)
  (out 'args (aref args2 0)))

(if (> (length *args*) 1)
  (out 'args (aref args2 1)))

(out 'type-of (type-of args2))
