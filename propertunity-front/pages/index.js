import { Inter } from 'next/font/google'
import { ReactComponent as ShapesTR } from '@/public/top-right-shapes.svg';

const inter = Inter({ subsets: ['latin'] })

export default function Home() {
  return (
    <main className="bg-white h-screen w-full px-52 py-4">
        <img src="@/public/top-right-shapes.svg" alt="background" />
    </main>
  )
}
