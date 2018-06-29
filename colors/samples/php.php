<?php
namespace DT\Engine\Controllers;
use DT\Engine\Models as Something;

class VanceTest extends Controller {
	public function index($req) {
		$start = microtime(true);
		for ($i = 0; $i < 5; $i++) {
			?><div>this is a div</div><?
		}
		switch ("asdf") {
			case 'asdf': echo'hi';break;
			default: break;
		}
		$this->asdf();
		$qwer = ['hi'=>'hello'];
		if (true) echo $qwer;
		else echo 'no';
		return (string)$qwer;
	}
	private static function asdf() { echo 'hi'; }
}
