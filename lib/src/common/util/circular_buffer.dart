import 'dart:collection';

/// A [CircularBuffer] with a fixed capacity supporting all [List] operations
///
/// ```dart
/// final buffer = CircularBuffer<int>(3)..add(1)..add(2);
/// print(buffer.length); // 2
/// print(buffer.first); // 1
/// print(buffer.isFilled); // false
/// print(buffer.isUnfilled); // true
///
/// buffer.add(3);
/// print(buffer.length); // 3
/// print(buffer.isFilled); // true
/// print(buffer.isUnfilled); // false
///
/// buffer.add(4);
/// print(buffer.first); // 2
/// ```
class CircularBuffer<T> with ListMixin<T> {
  /// Creates a [CircularBuffer] with a `capacity`
  CircularBuffer(this.capacity)
      : assert(capacity > 1, 'CircularBuffer must have a positive capacity.'),
        _buf = <T>[];

  /// Creates a [CircularBuffer] based on another `list`
  CircularBuffer.of(List<T> list, [int? capacity])
      : assert(
          capacity == null || list.length > 1,
          'CircularBuffer must have a positive capacity.',
        ),
        capacity = capacity ?? list.length,
        _buf = List<T>.of(capacity == null ? list : list.take(capacity));

  final List<T> _buf;

  /// Maximum number of elements of [CircularBuffer]
  final int capacity;

  int _start = 0;

  /// Clear the [CircularBuffer].
  ///
  /// [capacity] is unaffected.
  @override
  void clear() {
    _start = 0;
    _buf.clear();
  }

  @override
  void add(T element) {
    if (isUnfilled) {
      // The internal buffer is not at its maximum size.  Grow it.
      assert(_start == 0, 'Internal buffer grown from a bad state');
      _buf.add(element);
      return;
    }

    // All space is used, so overwrite the start.
    _buf[_start] = element;
    _start++;
    if (_start == capacity) {
      _start = 0;
    }
  }

  /// Number of used elements of [CircularBuffer]
  @override
  int get length => _buf.length;

  /// The [CircularBuffer] `isFilled` if the [length]
  /// is equal to the [capacity].
  bool get isFilled => _buf.length == capacity;

  /// The [CircularBuffer] `isUnfilled` if the [length] is
  /// less than the [capacity].
  bool get isUnfilled => _buf.length < capacity;

  @override
  T operator [](int index) {
    if (index >= 0 && index < _buf.length) {
      return _buf[(_start + index) % _buf.length];
    }
    throw RangeError.index(index, this);
  }

  @override
  void operator []=(int index, T value) {
    if (index >= 0 && index < _buf.length) {
      _buf[(_start + index) % _buf.length] = value;
    } else {
      throw RangeError.index(index, this);
    }
  }

  /// The `length` mutation is forbidden
  @override
  set length(int newLength) {
    throw UnsupportedError('Cannot resize a CircularBuffer.');
  }

  @override
  List<T> toList({bool growable = true}) => <T>[
        for (var i = 0; i < length; i++) this[i],
      ];
}
