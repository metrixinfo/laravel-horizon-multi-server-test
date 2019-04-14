<?php

namespace App\Console\Commands;

use App\Jobs\QueueRunJob;
use App\QueueTest;
use Illuminate\Console\Command;

class CreateJobs extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'run:test';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Create queued jobs for testing';

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        $jobs  = (int) $this->ask('How many jobs to queue?');
        $delay = (int) $this->ask('Delay between jobs in micro-seconds?');

        $this->info('Queuing ' . $jobs . ' jobs with a delay of ' . $delay . 'uS between jobs');

        for($i=0; $i<$jobs; $i++){

            $queue_test = QueueTest::create();

            if(!$queue_test){
                $this->error('Failed to create QueueTest');
                continue;
            }

            QueueRunJob::dispatch($queue_test->id);

            \usleep($delay);

        }

    }
}
