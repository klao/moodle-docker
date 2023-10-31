<?php
// This file is part of Moodle - http://moodle.org/
//
// Moodle is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// Moodle is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with Moodle.  If not, see <http://www.gnu.org/licenses/>.

/**
 * Performs a progress bar test
 *
 * @package    tool_heartbeat
 * @copyright  2017 Brendan Heywood <brendan@catalyst-au.net>
 * @license    http://www.gnu.org/copyleft/gpl.html GNU GPL v3 or later
 */
define('NO_OUTPUT_BUFFERING', true); // progress bar is used here

require(__DIR__ . '/../../../config.php');

$syscontext = context_system::instance();
-$PAGE->set_url('/admin/tool/examarchive/progress.php');
$PAGE->set_context($syscontext);
$PAGE->set_cacheable(false);    // progress bar is used here
echo $OUTPUT->header();
echo $OUTPUT->heading('Progress bar test');
echo '<br />';
echo date('Y-m-d H:i:s');
echo '<br />';

$progressbar = new progress_bar();
$progressbar->create();

$progressbar->update_full(0, '0%');
sleep(1);
$progressbar->update_full(25, '25%');
sleep(1);
$progressbar->update_full(50, '50%');
sleep(1);
$progressbar->update_full(75, '75%');
sleep(1);
$progressbar->update_full(100, '100%');

echo $OUTPUT->footer();
