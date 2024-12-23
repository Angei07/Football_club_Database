export default function ErrorMessage({
  message,
  onClose,
}: {
  message: string;
  onClose?: () => void;
}) {
  return (
    <div className="flex w-3/4 items-center gap-2 rounded-lg bg-red-crayola/75 p-4 text-sm text-white">
      <span className="grow">{message}</span>
      {onClose && (
        <button
          className="aspect-square min-w-[32px] rounded-lg bg-night/50 text-white"
          onClick={onClose}
        >
          X
        </button>
      )}
    </div>
  );
}
