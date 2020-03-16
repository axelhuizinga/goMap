/*
 * Copyright (C)2015-2016 Nicolas Cannasse
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 */
package hxbit;

import hxbit.NetworkSerializable;

@:generic
class VectorProxyData<T> extends BaseProxy {
	public var array : haxe.ds.Vector<T>;
	public function new(v) {
		array = v;
	}
}

abstract VectorProxy<T>(VectorProxyData<T>) {

	@:noCompletion public var __value(get, never) : haxe.ds.Vector<T>;
	@:noCompletion public var length(get, never) : Int;
	inline function get___value() : haxe.ds.Vector<T> return this == null ? null : this.array;
	inline function get_length() return this.array.length;

	inline function new(a) {
		this = a;
	}

	public inline function copy() {
		return new VectorProxy(new VectorProxyData(this.array.copy()));
	}

	public inline function join( s : String ) {
		return this.array.join(s);
	}

	public inline function sort(cmp:T->T->Int) {
		this.array.sort(cmp);
		this.mark();
	}

	public inline function toString() {
		return Std.string(this.array);
	}

	@:noCompletion public inline function bindHost(o, bit) {
		this.bindHost(o, bit);
	}

	@:noCompletion public inline function unbindHost() {
		this.unbindHost();
	}

	@:arrayAccess inline function get(idx:Int) {
		return this.array[idx];
	}

	@:arrayAccess inline function set(idx:Int,v:T) {
		this.array[idx] = v;
		this.mark();
	}

	@:from static inline function fromVector<T>( a : haxe.ds.Vector<T> ) {
		if( a == null ) return null;
		return new VectorProxy(new VectorProxyData(a));
	}
}
