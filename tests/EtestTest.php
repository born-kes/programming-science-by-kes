<?php
use PHPUnit\Framework\TestCase;

/**
 * Class ExampleTest
 * $this->assertTrue
 * $this->assertFalse
 * $this->assertEquals ==
 * $this->assertSame ===
 * $this->assertContains('value', $array) ['value']
 * $this->assertArrayHasKey('key', $array) ['key'=>'value']
 * $this->assertInternalType('array', $a); type_of2

$date = new DateTime();
$this->assertInstanceOf('DateTime', $date);
 */
// cls => czeuszczenie cmd

class EtestTest extends TestCase
{
    /** @var  \Prophecy\Prophecy\ObjectProphecy */
    private $prophet;
    private $mock;
    private $Basic;
    private $x;

    protected function setup() {
        $this->prophet = new \Prophecy\Prophet;
        /** @var Prophecy\Prophet $x TYPE_NAME */
        $x = $this->x = $this->prophet->prophesize()->willImplement ('Basic\Routing');


        $x->get('b')->willReturn('hello b');
        $x->get('a')->willReturn('hello');
        $this->mock = $x->reveal();

        $this->Basic   = new \Basic\Basic($this->mock);
    }

    protected function tearDown() {
        $this->prophet->checkPredictions();
    }

    public function testBasicRun()
    {
        //$this->x->get('b')->willReturn('hello nowe');

         $this->assertEquals($this->Basic->run(), 'hello b') ;
        return true;
    }

    /**
     * jeśli test poprzedni działa
     * @depends testBasicRun
     */
    public function testNext($a)
    {
        $this->assertTrue($a);

    }

    /**
     * Dane z Provider'a
     * @dataProvider additionProviderOne
     * @dataProvider additionProviderSecond
     */
    public function testAdd($a, $b, $expected)
    {
        $this->assertSame($expected, $a + $b, "{$a}, {$b}, {$expected}");
    }
    /**
     * Dane z Provider'a
     * @dataProvider additionProviderOne
     * @dataProvider additionProviderSecond
     */
    public function testAddSecond()
    {
        list( $a, $b, $expected) = func_get_args();
        $this->assertSame($expected, $a + $b, "{$a}, {$b}, {$expected}");
    }

    public function additionProviderOne()
    {
        return [
            [0, 0, 0],
            [0, 1, 1],
            [1, 0, 1],
         //   [1, 1, 3]
        ];
    }

    public function additionProviderSecond()
{
    return [
        'adding zeros'  => [0, 0, 0],
        'zero plus one' => [0, 1, 1],
        'one plus zero' => [1, 0, 1],
     //   'one plus one'  => [1, 1, 3]
    ];
}

    public function testFailingInclude()
    {
        $this->expectException(Error::class);

        throw @include 'not_existing_file.php';
    }

    public function testExpectFooActualFoo()
    {
        $this->expectOutputString('foo');
        echo 'foo';
    }
}