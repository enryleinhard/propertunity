import {useRouter} from 'next/router';
import {Inter} from 'next/font/google'

const inter = Inter({subsets: ['latin']})

export default function SignUpPage() {
    const router = useRouter()

    function handleSignInClick() {
        router.push('/member');
    }

    return (
        <main className={"bg-white h-screen w-full"}>
            <div className="flex h-screen items-center justify-center">
                <div className="w-full max-w-md">
                    <form className="bg-[#DFFFD8] shadow-md rounded px-8 pt-6 pb-8 mb-4">
                        <div className="mb-4">
                            <label className="block text-gray-700 font-bold mb-2" htmlFor="username">
                                Username
                            </label>
                            <input
                                className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                                id="username"
                                type="text"
                                placeholder="Enter your username"
                            />
                        </div>
                        <div className="mb-6">
                            <label className="block text-gray-700 font-bold mb-2" htmlFor="password">
                                Password
                            </label>
                            <input
                                className="shadow appearance-none border border-red-500 rounded w-full py-2 px-3 text-gray-700 mb-3 leading-tight focus:outline-none focus:shadow-outline"
                                id="password"
                                type="password"
                                placeholder="Enter your password"
                            />
                        </div>
                        <div className="flex items-center justify-between">
                            <button
                                className="bg-[#F7C8E0] hover:bg-[#B4E4FF] text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline"
                                type="button"
                                onClick={handleSignInClick}
                            >
                                Sign In
                            </button>
                        </div>
                    </form>
                </div>
            </div>

        </main>

    )
}
