<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;

class testCommand extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'command:name';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    /**
     * Execute the console command.
     *
     * @return void
     */
    public function handle(): void
    {
        $logFiles = glob(storage_path('logs/*.log'));
        foreach ($logFiles as $file) {
            if (file_exists($file)) {
                unlink($file);
            }
        }

        return;
    }
}
