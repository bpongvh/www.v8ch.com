<?php
/**
 * @author Robert Pratt <bpong@v8ch.com>
 * @copyright Robert Pratt 2018
 */

use Illuminate\Database\Seeder;
use V8CH\Combine\Auth\Models\User;

class WwwV8chComSeeder extends Seeder
{

    protected $userData = [];

    protected $userModels;

    public function __construct()
    {
        $this->setUserData();
        // Set type for PHPStorm inspections
        $this->userModels = collect([]);
    }

    public function seed()
    {
        echo "Populating Users ...\n";
        $this->populateUsers();
    }

    protected function createUser($userData)
    {
        factory(User::class)->create(array_merge($userData, ['password' => bcrypt($userData['password'])]));
    }

    protected function populateUsers()
    {
        collect($this->userData)->each(function ($userData) {
            $this->userModels->push($this->createUser($userData['user']));
        });
    }

    protected function setUserData() {
        $userEmails = env('SEED_USER_EMAILS', '');
        $this->userData = array_map(function($email) {
            $name = env('SEED_' . strtoupper($email) . '_NAME');
            $password = env('SEED_' . strtoupper($email) . '_PASSWORD');
            return [
                'user' => [
                    'email' => $email,
                    'name' => $name,
                    'password' => $password,
                ],
            ];
        }, explode(',', $userEmails));
    }

    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $this->seed();
    }
}