<?php
namespace Basic;
/**
 * Interface Routing
 *
 * co powinnien robić ruting
 * - pobierać listę przekierowań
 * - edytować listę przekierowań
 * - zapisać listę przekierowań
 *
 * - wybierać strategie
 * - wybierać view
 *
 */

interface Routing
{
    public function __construct (Basic $basic, $config = []);

    public function get($key);

    public function put($key, $val);
}